// dart-daap-client
// lib/src/client.dart

import "dart:io";
import "dart:typed_data";

import "package:daapc/src/objects.dart";
import "package:http/http.dart";
import "package:http_auth/http_auth.dart";
import "package:interpolator/interpolator.dart";

import "constants.dart";
import "exceptions.dart";

/// DAAP client.
class DaapClient {
  String host;
  int port;
  String _password;
  Client _connection;
  Uri _baseUrl;
  int _requestId = 0;

  DaapObject serverInfo;
  DaapObject contentCodes;
  DaapObject sessionInfo;

  /// DAAP client constructor.
  ///
  /// Sets default port value.
  /// Hides password value.
  DaapClient(String host, {int port = 3689, String password}) {
    this.host = host;
    this.port = port;
    this._password = password;
  }

  /// Creates client class string representation.
  ///
  /// If password was supplied add to representation hidden password
  /// to indicate this client is connected to the server with authorization.
  @override
  String toString() {
    if (this._password != null) {
      return "<DaapClient: {host: ${this.host}, port: ${this.port}, password: ${"*" * this._password.length}}>";
    } else {
      return "<DaapClient: {host: ${this.host}, port: ${this.port}}>";
    }
  }

  /// Default HTTP request headers.
  Map<String, String> get _headers => requestHeaders;

  /// Connect to DAAP server.
  ///
  /// Creates base connection URL.
  /// Get DAAP content codes/server info/session info/databases.
  void connect() async {
    this._baseUrl = new Uri(
      scheme: "http",
      host: this.host,
      port: this.port,
    );

    this.serverInfo = await this.getServerInfo();
    this.contentCodes = await this.getContentCodes();
    this.sessionInfo = await this.login();
  }

  /// Shared HTTP connection getter.
  ///
  /// If connection does not exists creates new one.
  Client get connection {
    if (this._connection == null) {
      if (this._password == null) {
        this._connection = Client();
      } else {
        // DAAP does not require username, so use empty.
        this._connection = BasicAuthClient("", this._password);
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
  Future<Uint8List> request(String url) async {
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
        throw DaapException();
      } else {
        return response.bodyBytes;
      }
    } on ClientException {
      throw DaapException();
    } on SocketException {
      throw DaapException();
    }
  }

  /// Get server content codes.
  ///
  /// Practically required.
  Future<DaapObject> getContentCodes() async {
    var url = this._baseUrl;
    url = url.replace(path: contentCodesUrlPath);
    return DaapObject(await this.request(url.toString()));
  }

  /// Get server info.
  Future<DaapObject> getServerInfo() async {
    var url = this._baseUrl;
    url = url.replace(path: serverInfoUrlPath);
    return DaapObject(await this.request(url.toString()));
  }

  /// Login to server.
  Future<DaapObject> login() async {
    var url = this._baseUrl;
    url = url.replace(path: loginUrlPath);
    return DaapObject(await this.request(url.toString()));
  }

  /// Get databases from server.
  Future<DaapObject> getDatabases(int sessionId) async {
    var url = this._baseUrl;
    url = url.replace(
        path: databasesUrlPath,
        queryParameters: {"session-id": sessionId.toString()});
    return DaapObject(await this.request(url.toString()));
  }

  /// Get database from server.
  ///
  /// :param metaCodes: list of fields codes to obtain in server response.
  Future<DaapObject> getDatabase(int databaseId, int sessionId,
      {List<String> metaCodes = databaseQueryDefaultMetaCodes}) async {
    // TODO: move that code to separate method.
    var meta = <String>[];
    for (String code in metaCodes) {
      if (dmapCodeTypes.containsKey(code)) {
        meta.add(dmapCodeTypes[code].name);
      } else {
        throw DaapDecodeException();
      }
    }

    var url = this._baseUrl;
    url = url.replace(
        path: Interpolator(databaseUrlPath)(
            {"databaseId": databaseId.toString()}),
        queryParameters: {
          "type": "music",
          "session-id": sessionId.toString(),
          "meta": meta.join(",")
        });
    return DaapObject(await this.request(url.toString()));
  }

  /// Get database playlists from server.
  ///
  /// :param metaCodes: list of fields codes to obtain in server response.
  Future<DaapObject> getPlaylists(int databaseId, int sessionId,
      {List<String> metaCodes = playlistsQueryDefaultMetaCodes}) async {
    // TODO: move that code to separate method.
    var meta = <String>[];
    for (String code in metaCodes) {
      if (dmapCodeTypes.containsKey(code)) {
        meta.add(dmapCodeTypes[code].name);
      } else {
        throw DaapDecodeException();
      }
    }
    var url = this._baseUrl;
    url = url.replace(
        path: Interpolator(playlistsUrlPath)(
            {"databaseId": databaseId.toString()}),
        queryParameters: {
          "session-id": sessionId.toString(),
          "meta": meta.join(",")
        });
    return DaapObject(await this.request(url.toString()));
  }

  /// Get database playlist from server.
  ///
  /// :param metaCodes: list of fields codes to obtain in server response.
  Future<DaapObject> getPlaylist(int databaseId, int playlistId, int sessionId,
      {List<String> metaCodes = playlistQueryDefaultMetaCodes}) async {
    // TODO: move that code to separate method.
    var meta = <String>[];
    for (String code in metaCodes) {
      if (dmapCodeTypes.containsKey(code)) {
        meta.add(dmapCodeTypes[code].name);
      } else {
        throw DaapDecodeException();
      }
    }

    var url = this._baseUrl;
    url = url.replace(
        path: Interpolator(playlistUrlPath)({
          "databaseId": databaseId.toString(),
          "playlistId": playlistId.toString()
        }),
        queryParameters: {
          "session-id": sessionId.toString(),
          "meta": meta.join(",")
        });
    return DaapObject(await this.request(url.toString()));
  }
}
