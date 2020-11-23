// daap-client
// lib/src/client.dart

import "dart:io";
import "dart:typed_data";

import "package:http/http.dart";
import "package:http_auth/http_auth.dart";

import "constants.dart";
import "exceptions.dart";

/// DAAP client.
class DaapClient {
  String host;
  int port;
  String _password;
  Client _connection;
  Uri _baseUrl;
  int requestId = 0;

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
  /// Get DAAP content codes/server info and login.
  void connect() async {
    this._baseUrl = new Uri(
      scheme: "http",
      host: this.host,
      port: this.port,
    );

    await this.getServerInfo();
    await this.getContentCodes();
    await this.login();
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
        "Client-DAAP-Request-ID", (dynamic val) => requestId.toString(),
        ifAbsent: () => requestId.toString());
    this.requestId++;
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
    }
  }

  /// Get server content codes.
  ///
  /// Practically required.
  Future<Uint8List> getContentCodes() async {
    var url = this._baseUrl;
    url = url.replace(path: contentCodesUrlPath);
    return await this.request(url.toString());
  }

  /// Get server info.
  Future<Uint8List> getServerInfo() async {
    var url = this._baseUrl;
    url = url.replace(path: serverInfoUrlPath);
    return await this.request(url.toString());
  }

  /// Login to server.
  Future<Uint8List> login() async {
    var url = this._baseUrl;
    url = url.replace(path: loginUrlPath);
    return await this.request(url.toString());
  }

  /// Logout from server.
  Future<Uint8List> logout() async {
    var url = this._baseUrl;
    url = url.replace(path: logoutUrlPath);
    return await this.request(url.toString());
  }
}
