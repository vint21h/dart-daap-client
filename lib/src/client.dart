// dart-daap-client
// lib/src/client.dart

import "dart:io";
import "dart:typed_data";
import "dart:convert";

import "package:http_auth/http_auth.dart";
import "package:http/http.dart";
import "package:interpolator/interpolator.dart";

import "constants.dart";
import "exceptions.dart";
import "objects.dart";

/// DAAP client.
class DaapClient {
  /// Host to connect to.
  String host = "";

  /// Port to use.
  int port = 3689;
  String? _password;
  Client? _connection;
  Uri _baseUrl = Uri(scheme: "http"); // ignore: prefer_final_fields
  int _requestId = 0;

  /// Server info data.
  DaapObject? serverInfo;

  /// Content codes data.
  DaapObject? contentCodes;

  /// Session info data.
  DaapObject? sessionInfo;

  /// DAAP client constructor.
  ///
  /// Sets default port value.
  /// Hides password value.
  /// Creates base connection URL.
  DaapClient(String host, {int port = 3689, String? password}) {
    this.host = host; // ignore: prefer_initializing_formals
    this.port = port; // ignore: prefer_initializing_formals
    if (password != null) {
      _password = password;
    }

    _baseUrl = _baseUrl.replace(host: this.host, port: this.port);
  }

  /// Creates client class string representation.
  ///
  /// If password was supplied add to representation hidden password
  /// to indicate this client is connected to the server with authorization.
  @override
  String toString() {
    if (_password != null) {
      // ignore: lines_longer_than_80_chars
      return "<DaapClient: {host: $host, port: $port, password: ${"*" * _password!.length}}>";
    } else {
      return "<DaapClient: {host: $host, port: $port}>";
    }
  }

  /// Default HTTP request headers.
  Map<String, String> get _headers => requestHeaders;

  /// Connect to DAAP server.
  ///
  /// Get DAAP content codes/server info/session info.
  Future<void> connect() async {
    serverInfo = await getServerInfo();
    contentCodes = await getContentCodes();
    sessionInfo = await login();
  }

  /// Shared HTTP connection getter.
  ///
  /// If connection does not exists creates new one.
  Client? get connection {
    if (_connection == null) {
      if (_password != null) {
        // DAAP does not require username, so use empty.
        _connection = BasicAuthClient("", _password!);
      } else {
        _connection = Client();
      }
    }
    return _connection;
  }

  /// Get custom HTTP headers.
  ///
  /// Return HTTP connection headers with dynamic request ID.
  Map<String, String> get headers {
    _headers.update(
        "Client-DAAP-Request-ID", (dynamic val) => _requestId.toString(),
        ifAbsent: () => _requestId.toString());
    _requestId++;
    return _headers;
  }

  /// Make a GET HTTP request to DAAP server.
  ///
  /// Throws [DaapAuthRequiredException] in case of server auth required.
  /// Throws [DaapAuthenticationFailureException]
  /// in case of wrong credentials provided.
  /// Throws [DaapTooManyConnectionsException]
  /// in case of server overload.
  /// Throws [DaapException]
  /// in case of unexpected response status code or network error.
  Future<Uint8List> request(Uri url) async {
    try {
      var response = await connection!.get(url, headers: headers);

      if (response.statusCode == HttpStatus.unauthorized) {
        throw DaapAuthRequiredException();
      } else if (response.statusCode == HttpStatus.forbidden) {
        throw DaapAuthenticationFailureException();
      } else if (response.statusCode == HttpStatus.serviceUnavailable) {
        throw DaapTooManyConnectionsException();
      } else if (response.statusCode == HttpStatus.noContent) {
        return Uint8List.fromList([]);
      } else if (response.statusCode != HttpStatus.ok) {
        throw DaapException(
            // ignore: lines_longer_than_80_chars
            "Response status: '${response.statusCode}'. Response content: '${utf8.decode(response.bodyBytes)}'.");
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
    var url = _baseUrl;
    url = url.replace(path: contentCodesUrlPath);
    return DaapObject(await request(url));
  }

  /// Get server info.
  Future<DaapObject> getServerInfo() async {
    var url = _baseUrl;
    url = url.replace(path: serverInfoUrlPath);
    return DaapObject(await request(url));
  }

  /// Login to the server.
  Future<DaapObject> login() async {
    var url = _baseUrl;
    url = url.replace(path: loginUrlPath);
    return DaapObject(await request(url));
  }

  /// Get databases from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<DaapObject> getDatabases({int? sessionId}) async {
    var url = _baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: databasesUrlPath,
          queryParameters: {"session-id": sessionId.toString()});
    } else {
      if (sessionInfo != null) {
        return await getDatabases(
            sessionId: sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID));
      } else {
        // TODO: test it.
        throw DaapImproperlyConfiguredException(
            // ignore: lines_longer_than_80_chars
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return DaapObject(await request(url));
  }

  /// Get database from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<DaapObject> getDatabase(int databaseId,
      {int? sessionId,
      List<String> metaCodes = databaseQueryDefaultMetaCodes}) async {
    var url = _baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(databaseUrlPath)(
              {"databaseId": databaseId.toString()}),
          queryParameters: {
            "type": "music",
            "session-id": sessionId.toString(),
            "meta": getRequestMeta(metaCodes),
          });
    } else {
      if (sessionInfo != null) {
        return await getDatabase(databaseId,
            sessionId: sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID),
            metaCodes: metaCodes);
      } else {
        // TODO: test it.
        throw DaapImproperlyConfiguredException(
            // ignore: lines_longer_than_80_chars
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return DaapObject(await request(url));
  }

  /// Get database playlists from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<DaapObject> getPlaylists(int databaseId,
      {int? sessionId,
      List<String> metaCodes = playlistsQueryDefaultMetaCodes}) async {
    var url = _baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(playlistsUrlPath)(
              {"databaseId": databaseId.toString()}),
          queryParameters: {
            "session-id": sessionId.toString(),
            "meta": getRequestMeta(metaCodes),
          });
    } else {
      if (sessionInfo != null) {
        return await getPlaylists(databaseId,
            sessionId: sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID),
            metaCodes: metaCodes);
      } else {
        // TODO: test it.
        throw DaapImproperlyConfiguredException(
            // ignore: lines_longer_than_80_chars
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return DaapObject(await request(url));
  }

  /// Get database playlist from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<DaapObject> getPlaylist(int databaseId, int playlistId,
      {int? sessionId,
      List<String> metaCodes = playlistQueryDefaultMetaCodes}) async {
    var url = _baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(playlistUrlPath)({
            "databaseId": databaseId.toString(),
            "playlistId": playlistId.toString()
          }),
          queryParameters: {
            "session-id": sessionId.toString(),
            "meta": getRequestMeta(metaCodes),
          });
    } else {
      if (sessionInfo != null) {
        return await getPlaylist(databaseId, playlistId,
            sessionId: sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID),
            metaCodes: metaCodes);
      } else {
        // TODO: test it.
        throw DaapImproperlyConfiguredException(
            // ignore: lines_longer_than_80_chars
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return DaapObject(await request(url));
  }

  /// Get song from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<Uint8List> getSong(int databaseId, int songId, String songFormat,
      {int? sessionId}) async {
    var url = _baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(songUrlPath)({
            "databaseId": databaseId.toString(),
            "songId": songId.toString(),
            "songFormat": songFormat
          }),
          queryParameters: {"session-id": sessionId.toString()});
    } else {
      if (sessionInfo != null) {
        return await getSong(databaseId, songId, songFormat,
            sessionId: sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID));
      } else {
        throw DaapImproperlyConfiguredException(
            // ignore: lines_longer_than_80_chars
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return await request(url);
  }

  /// Get song artwork from the server.
  ///
  /// Throws [DaapImproperlyConfiguredException] in case of calling without
  /// supplied [sessionId] before [connect] call.
  Future<Uint8List> getSongArtwork(int databaseId, int songId,
      {int? sessionId}) async {
    var url = _baseUrl;
    if (sessionId != null) {
      url = url.replace(
          path: Interpolator(songArtworkUrlPath)({
            "databaseId": databaseId.toString(),
            "songId": songId.toString(),
          }),
          queryParameters: {"session-id": sessionId.toString()});
    } else {
      if (sessionInfo != null) {
        return await getSongArtwork(databaseId, songId,
            sessionId: sessionInfo!.getAtom(DMAP_CODE_DMAP_SESSIONID));
      } else {
        throw DaapImproperlyConfiguredException(
            // ignore: lines_longer_than_80_chars
            "Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server.");
      }
    }
    return await request(url);
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
        throw DmapEncodeException(
            "'$code' was not found in actual DMAP codes list.");
      }
    }
    return meta.join(",");
  }
}
