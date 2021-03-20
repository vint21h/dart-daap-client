// dart-daap-client
// lib/src/client.dart

import "dart:io";
import "dart:typed_data";

import "package:http_auth/http_auth.dart";
import "package:http/http.dart";
import "package:interpolator/interpolator.dart";

import "constants.dart";
import "exceptions.dart";
import "objects.dart";

/// DAAP client.
class DaapClient {
  /// host to connect to
  String host;
  /// port to use
  int port;
  String? _password;
  Client _connection;
  Uri _baseUrl = Uri(scheme: "http");
  int _requestId = 0;

  /// server info data
  DaapObject? serverInfo;
  /// content codes data
  DaapObject? contentCodes;
  /// session info data
  DaapObject? sessionInfo;

  /// DAAP client constructor.
  ///
  /// Sets default port value.
  /// Hides password value.
  /// Creates base connection URL.
  DaapClient(String host, {int port = 3689, String? password}) {
    this.host = host;
    this.port = port;
    if (password != null) {
      _password = password;
    }

    _baseUrl.replace(host: this.host);
    _baseUrl.replace(port: this.port);
  }

  /// Creates client class string representation.
  ///
  /// If password was supplied add to representation hidden password
  /// to indicate this client is connected to the server with authorization.
  @override
  String toString() {
    if (_password != null) {
      return "<DaapClient: {host: ${this.host}, port: ${this.port}, password: ${"*" * this._password!.length}}>";
    } else {
      return "<DaapClient: {host: ${this.host}, port: ${this.port}}>";
    }
  }

  /// Default HTTP request headers.
  Map<String, String> get _headers => requestHeaders;

  /// Connect to DAAP server.
  ///
  /// Get DAAP content codes/server info/session info.
  void connect() async {
    this.serverInfo = await this.getServerInfo();
    this.contentCodes = await this.getContentCodes();
    this.sessionInfo = await this.login();
  }

  /// Shared HTTP connection getter.
  ///
  /// If connection does not exists creates new one.
  Client get connection {
    if (this._connection == null) {
      if (this._password != null) {
        // DAAP does not require username, so use empty.
        this._connection = BasicAuthClient("", this._password!);
      } else {
        this._connection = Client();
      }
    }
    return this._connection;
  }

  /// Get custom HTTP headers.
  ///
  /// Return HTTP connection headers with dynamic request ID.
  Map<String, String> get headers {
    this._headers.update(
        "Client-DAAP-Request-ID", (dynamic val) => this._requestId.toString(),
        ifAbsent: () => this._requestId.toString());
    this._requestId++;
    return this._headers;
  }

  /// Make a GET HTTP request to DAAP server.
  ///
  /// Throws [DaapAuthRequiredException] in case of server auth required.
  /// Throws [DaapAuthenticationFailureException] in case of wrong credentials provided.
  /// Throws [DaapTooManyConnectionsException] in case of server overload.
  /// Throws [DaapException] in case of unexpected response status code or network error.
  Future<Uint8List> request(Uri url) async {
    try {
      var response = await this.connection.get(url, headers: this.headers);

      if (response.statusCode == HttpStatus.unauthorized) {
        throw DaapAuthRequiredException();
      } else if (response.statusCode == HttpStatus.forbidden) {
        throw DaapAuthenticationFailureException();
      } else if (response.statusCode == HttpStatus.serviceUnavailable) {
        throw DaapTooManyConnectionsException();
      } else if (response.statusCode == HttpStatus.noContent) {
        return null;
      } else if (response.statusCode != HttpStatus.ok) {
        throw DaapException("Response status: '${response.statusCode}'");
      } else {
        return response.bodyBytes;
      }
    } on ClientException {
      throw DaapException("Client error.");
    } on SocketException {
      throw DaapException("Socket error.");
    }
  }

  /// Get server content codes.
  ///
  /// Look useless but practically required.
  Future<DaapObject> getContentCodes() async {
    var url = this._baseUrl;
    url = url.replace(path: contentCodesUrlPath);
    return DaapObject(await this.request(url));
  }

  /// Get server info.
  Future<DaapObject> getServerInfo() async {
    var url = this._baseUrl;
    url = url.replace(path: serverInfoUrlPath);
    return DaapObject(await this.request(url));
  }

  /// Login to the server.
  Future<DaapObject> login() async {
    var url = this._baseUrl;
    url = url.replace(path: loginUrlPath);
    return DaapObject(await this.request(url));
  }

  /// Get databases from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<DaapObject> getDatabases({int? sessionId}) async {
    var url = this._baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: databasesUrlPath,
          queryParameters: {"session-id": sessionId.toString()});
    } else {
      if (this.sessionInfo != null) {
        return await this.getDatabases(
            sessionId: this.sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID));
      } else {
        // TODO: test it.
        throw new DaapImproperlyConfiguredException(
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return DaapObject(await this.request(url));
  }

  /// Get database from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<DaapObject> getDatabase(int databaseId,
      {int? sessionId,
      List<String> metaCodes = databaseQueryDefaultMetaCodes}) async {
    var url = this._baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(databaseUrlPath)(
              {"databaseId": databaseId.toString()}),
          queryParameters: {
            "type": "music",
            "session-id": sessionId.toString(),
            "meta": this.getRequestMeta(metaCodes),
          });
    } else {
      if (this.sessionInfo != null) {
        return await this.getDatabase(databaseId,
            sessionId: this.sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID),
            metaCodes: metaCodes);
      } else {
        // TODO: test it.
        throw new DaapImproperlyConfiguredException(
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return DaapObject(await this.request(url));
  }

  /// Get database playlists from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<DaapObject> getPlaylists(int databaseId,
      {int? sessionId,
      List<String> metaCodes = playlistsQueryDefaultMetaCodes}) async {
    var url = this._baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(playlistsUrlPath)(
              {"databaseId": databaseId.toString()}),
          queryParameters: {
            "session-id": sessionId.toString(),
            "meta": this.getRequestMeta(metaCodes),
          });
    } else {
      if (this.sessionInfo != null) {
        return await this.getPlaylists(databaseId,
            sessionId: this.sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID),
            metaCodes: metaCodes);
      } else {
        // TODO: test it.
        throw new DaapImproperlyConfiguredException(
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return DaapObject(await this.request(url));
  }

  /// Get database playlist from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<DaapObject> getPlaylist(int databaseId, int playlistId,
      {int? sessionId,
      List<String> metaCodes = playlistQueryDefaultMetaCodes}) async {
    var url = this._baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(playlistUrlPath)({
            "databaseId": databaseId.toString(),
            "playlistId": playlistId.toString()
          }),
          queryParameters: {
            "session-id": sessionId.toString(),
            "meta": this.getRequestMeta(metaCodes),
          });
    } else {
      if (this.sessionInfo != null) {
        return await this.getPlaylist(databaseId, playlistId,
            sessionId: this.sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID),
            metaCodes: metaCodes);
      } else {
        // TODO: test it.
        throw new DaapImproperlyConfiguredException(
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return DaapObject(await this.request(url));
  }

  /// Get song file/stream from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<Uint8List> getSong(int databaseId, int songId, String songFormat,
      {int? sessionId}) async {
    var url = this._baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(songUrlPath)({
            "databaseId": databaseId.toString(),
            "songId": songId.toString(),
            "songFormat": songFormat
          }),
          queryParameters: {"session-id": sessionId.toString()});
    } else {
      if (this.sessionInfo != null) {
        // TODO: test it.
        return await this.getSong(databaseId, songId, songFormat,
            sessionId: this.sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID));
      } else {
        throw new DaapImproperlyConfiguredException(
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return await this.request(url);
  }

  /// Create request meta key value from DMAP codes list.
  ///
  /// Throws [DmapEncodeException] in case of unknown code in [metaCodes].
  String getRequestMeta(List<String> metaCodes) {
    var meta = <String>[];
    for (var code in metaCodes) {
      if (dmapCodeTypes.containsKey(code)) {
        meta.add(dmapCodeTypes[code]!.name);
      } else {
        throw new DmapEncodeException(
            "'${code}' was not found in actual DMAP codes list.");
      }
    }
    return meta.join(",");
  }
}
