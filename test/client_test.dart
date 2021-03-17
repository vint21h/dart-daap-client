// daap-client
// test/client_test.dart

import "dart:io";
import "dart:typed_data";

import "package:http/http.dart";
import "package:http_auth/http_auth.dart";
import "package:nock/nock.dart";
import "package:test/test.dart";

import "package:daapc/daapc.dart";

void main() {
  setUpAll(() {
    nock.init();
  });
  setUp(() {
    nock.cleanAll();
  });
  group(DaapClient, () {
    test("'DaapClient' constructor must initialize connection config", () {
      final client = DaapClient("127.0.0.1", port: 3668, password: "password");
      expect(client.host, "127.0.0.1");
      expect(client.port, 3668);
    }, tags: ["client", "DaapClient"]);
    test(
        "'toString' method must return formatted string with connection config",
        () {
      final client = DaapClient("127.0.0.1");

      expect(client.toString(), "<DaapClient: {host: 127.0.0.1, port: 3689}>");
    }, tags: ["client", "DaapClient", "toString"]);
    test(
        "'toString' method must return formatted string with connection config with secured password",
        () {
      final client = DaapClient("127.0.0.1", password: "password");

      expect(client.toString(),
          "<DaapClient: {host: 127.0.0.1, port: 3689, password: ********}>");
    }, tags: ["client", "DaapClient", "toString"]);
    test("'headers' method must return dynamic request headers", () {
      final Map<String, String> expected = {
        "Client-DAAP-Version": "3.0",
        "Client-DAAP-Access-Index": "2",
        "User-Agent":
            "daapc/0.0.0 (https://github.com/vint21h/dart-daap-client/)",
        "Accept": "application/x-dmap-tagged",
        "Client-DAAP-Request-ID": "0",
      };
      final client = DaapClient("127.0.0.1");

      expect(client.headers, expected);
    }, tags: ["client", "DaapClient", "headers"]);
    test(
        "'headers' method must return dynamic request headers after multiple requests",
        () {
      final Map<String, String> expected = {
        "Client-DAAP-Version": "3.0",
        "Client-DAAP-Access-Index": "2",
        "User-Agent":
            "daapc/0.0.0 (https://github.com/vint21h/dart-daap-client/)",
        "Accept": "application/x-dmap-tagged",
        "Client-DAAP-Request-ID": "1",
      };
      final client = DaapClient("127.0.0.1");

      client.headers; // increment request ID

      expect(client.headers, expected);
    }, tags: ["client", "DaapClient", "headers"]);
    test("'connection' getter must return HTTP client class instance", () {
      final client = DaapClient("127.0.0.1");

      expect(client.connection, isA<Client>());
    }, tags: ["client", "DaapClient", "connection"]);
    test(
        "'connection' getter must return HTTP client class instance with basic authorization",
        () {
      final client = DaapClient("127.0.0.1", password: "password");
      expect(client.connection, isA<BasicAuthClient>());
    }, tags: ["client", "DaapClient", "connection"]);
    test("'request' method must return HTTP GET request result data", () async {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/server-info").get("")
        ..reply(HttpStatus.ok, "");

      expect(await client.request("http://127.0.0.1:3689/server-info"), []);
    }, tags: ["client", "DaapClient", "request"]);
    test(
        "'request' method must raise 'DaapAuthRequiredException' when making GET HTTP request to server (authentication required case)",
        () {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/server-info").get("")
        ..reply(HttpStatus.unauthorized, "401 Unauthorized");

      expect(
          client.request("http://127.0.0.1:3689/server-info"),
          throwsA(isA<DaapAuthRequiredException>().having(
              (error) => error.errMsg(),
              "message",
              "DaapClient: auth required.")));
    }, tags: ["client", "DaapClient", "request"]);
    test(
        "'request' method must raise 'DaapAuthenticationFailureException' when making GET HTTP request to server (wrong credentials case)",
        () {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/server-info").get("")
        ..reply(HttpStatus.forbidden, "403 Forbidden");

      expect(
          client.request("http://127.0.0.1:3689/server-info"),
          throwsA(isA<DaapAuthenticationFailureException>().having(
              (error) => error.errMsg(),
              "message",
              "DaapClient: authentication failure.")));
    }, tags: ["client", "DaapClient", "request"]);
    test(
        "'request' method must raise 'DaapTooManyConnectionsException' when making GET HTTP request to server (server overloading case)",
        () {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/server-info").get("")
        ..reply(HttpStatus.serviceUnavailable, "503 Service Unavailable");

      expect(
          client.request("http://127.0.0.1:3689/server-info"),
          throwsA(isA<DaapTooManyConnectionsException>().having(
              (error) => error.errMsg(),
              "message",
              "DaapClient: too many connections.")));
    }, tags: ["client", "DaapClient", "request"]);
    test(
        "'request' method must raise 'DaapException' when making GET HTTP request to server (server unexpected response code case)",
        () {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/server-info").get("")
        ..reply(500, "500 Internal Server Error");

      expect(
          client.request("http://127.0.0.1:3689/server-info"),
          throwsA(isA<DaapException>().having(
              (error) => error.toString(),
              "message",
              "DaapClient: making request error. Response status: '500'")));
    }, tags: ["client", "DaapClient", "request"]);
    test("'getContentCodes' method must return server content codes data",
        () async {
      final client = DaapClient("127.0.0.1");
      final Uint8List data = Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);

      nock("http://127.0.0.1:3689/content-codes").get("")
        ..reply(HttpStatus.ok, data);
      DaapObject result = await client.getContentCodes();

      expect(result.toString(),
          "<DaapObject: {code: '<DmapCode: {code: 'mccr', name: 'dmap.contentcodesresponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getContentCodes"]);
    test("'getServerInfo' method must return server info data", () async {
      final client = DaapClient("127.0.0.1");
      final Uint8List data =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);

      nock("http://127.0.0.1:3689/server-info").get("")
        ..reply(HttpStatus.ok, data);
      DaapObject result = await client.getServerInfo();

      expect(result.toString(),
          "<DaapObject: {code: '<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getServerInfo"]);
    test("'login' method must return session info data", () async {
      final client = DaapClient("127.0.0.1");
      final Uint8List data =
          Uint8List.fromList([109, 108, 111, 103, 0, 0, 0, 0]);

      nock("http://127.0.0.1:3689/login").get("")..reply(HttpStatus.ok, data);
      DaapObject result = await client.login();

      expect(result.toString(),
          "<DaapObject: {code: '<DmapCode: {code: 'mlog', name: 'dmap.loginresponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "login"]);
    test("'getRequestMeta' method must return request meta key value", () {
      final client = DaapClient("127.0.0.1");

      expect(client.getRequestMeta(["asaa", "asar"]),
          "daap.songalbumartist,daap.songartist");
    }, tags: ["client", "DaapClient", "getRequestMeta"]);
    test(
        "'getRequestMeta' method must raise 'DmapEncodeException' in case of unknown code",
        () {
      final client = DaapClient("127.0.0.1");

      try {
        client.getRequestMeta(["test"]);
      } on DmapEncodeException catch (error) {
        expect(
            error,
            TypeMatcher<DmapEncodeException>().having(
                (error) => error.toString(),
                "message",
                "DmapObject: encode data error. 'test' was not found in actual DMAP codes list."));
        return;
      }
      throw Exception("Expected DmapDecodeException");
    }, tags: ["client", "DaapClient", "getRequestMeta"]);
  });
}
