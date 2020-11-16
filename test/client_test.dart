// daap-client
// test/client_test.dart

import "package:daapc/daapc.dart";
import "package:daapc/src/constants.dart";
import "package:daapc/src/exceptions.dart";
import "package:http/http.dart";
import "package:http_auth/http_auth.dart";
import "package:nock/nock.dart";
import "package:test/test.dart";

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
    }, tags: ["internal"]);
    test(
        "'toString' method must return formatted string with connection config",
        () {
      final client = DaapClient("127.0.0.1");

      expect(client.toString(), "<DaapClient: {host: 127.0.0.1, port: 3689}>");
    }, tags: ["internal"]);
    test(
        "'toString' method must return formatted string with connection config with secured password",
        () {
      final client = DaapClient("127.0.0.1", password: "password");

      expect(client.toString(),
          "<DaapClient: {host: 127.0.0.1, port: 3689, password: ********}>");
    }, tags: ["internal"]);
    test("'headers' method must return dynamic request headers", () {
      final Map<String, String> expected = {
        "Client-DAAP-Version": "3.0",
        "Client-DAAP-Access-Index": "2",
        "User-Agent": "daapc/0.0.0 (https://github.com/vint21h/daap-client/)",
        "Accept": "application/x-dmap-tagged",
        "Client-DAAP-Request-ID": "0",
      };
      final client = DaapClient("127.0.0.1");

      expect(client.headers, expected);
    }, tags: ["internal"]);
    test(
        "'headers' method must return dynamic request headers after multiple requests",
        () {
      final Map<String, String> expected = {
        "Client-DAAP-Version": "3.0",
        "Client-DAAP-Access-Index": "2",
        "User-Agent": "daapc/0.0.0 (https://github.com/vint21h/daap-client/)",
        "Accept": "application/x-dmap-tagged",
        "Client-DAAP-Request-ID": "1",
      };
      final client = DaapClient("127.0.0.1");

      client.headers;

      expect(client.headers, expected);
    }, tags: ["internal"]);
    test("'connection' getter must return HTTP client class instance", () {
      final client = DaapClient("127.0.0.1");

      expect(client.connection, isA<Client>());
    }, tags: ["internal"]);
    test(
        "'connection' getter must return HTTP client class instance with basic authorization",
        () {
      final client = DaapClient("127.0.0.1", password: "password");
      expect(client.connection, isA<BasicAuthClient>());
    }, tags: ["internal"]);
    test("'call' method must return HTTP GET request result data", () async {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/content-codes").get("")
        ..reply(httpStatusOk, "");

      expect(await client.call("http://127.0.0.1:3689/content-codes"), []);
    }, tags: ["network"]);
    test(
        "'call' method must raise 'DaapAuthRequiredException' when making GET HTTP request to server (authentication required case)",
        () {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/content-codes").get("")
        ..reply(httpStatusUnauthorized, "401 Unauthorized");

      expect(client.call("http://127.0.0.1:3689/content-codes"),
          throwsA(TypeMatcher<DaapAuthRequiredException>()));
    }, tags: ["network"]);
    test(
        "'call' method must raise 'DaapAuthenticationFailureException' when making GET HTTP request to server (wrong credentials case)",
        () {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/content-codes").get("")
        ..reply(httpStatusForbidden, "403 Forbidden");

      expect(client.call("http://127.0.0.1:3689/content-codes"),
          throwsA(TypeMatcher<DaapAuthenticationFailureException>()));
    }, tags: ["network"]);
    test(
        "'call' method must raise 'DaapTooManyConnectionsException' when making GET HTTP request to server (server overloading case)",
        () {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/content-codes").get("")
        ..reply(httpStatusServiceUnavailable, "503 Service Unavailable");

      expect(client.call("http://127.0.0.1:3689/content-codes"),
          throwsA(TypeMatcher<DaapTooManyConnectionsException>()));
    }, tags: ["network"]);
    test(
        "'call' method must raise 'DaapException' when making GET HTTP request to server (server unexpected response code case)",
        () {
      final client = DaapClient("127.0.0.1");

      nock("http://127.0.0.1:3689/content-codes").get("")
        ..reply(500, "500 Internal Server Error");

      expect(client.call("http://127.0.0.1:3689/content-codes"),
          throwsA(TypeMatcher<DaapException>()));
    }, tags: ["network"]);
  });
}
