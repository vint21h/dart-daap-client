// daap-client
// test/client_test.dart

import "package:test/test.dart";
import "package:http/http.dart";
import "package:http_auth/http_auth.dart";

import "package:daapc/daapc.dart";

void main() {
  group(DaapClient, () {
    test("'DaapClient' constructor must initialize connection config", () {
      final client = DaapClient("127.0.0.1", port: 3668, password: "password");
      expect(client.host, "127.0.0.1");
      expect(client.port, 3668);
    });
    test(
        "'toString' method must return formatted string with connection config",
        () {
      final client = DaapClient("127.0.0.1");
      expect(client.toString(), "<DaapClient: {host: 127.0.0.1, port: 3689}>");
    });
    test(
        "'toString' method must return formatted string with connection config with secured password",
        () {
      final client = DaapClient("127.0.0.1", password: "password");
      expect(client.toString(),
          "<DaapClient: {host: 127.0.0.1, port: 3689, password: ********}>");
    });
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
    });
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
    });
    test("'connection' getter must return HTTP client class instance", () {
      final client = DaapClient("127.0.0.1");
      expect(client.connection, isA<Client>());
    });
    test("'connection' getter must return HTTP client class instance with basic authorization", () {
      final client = DaapClient("127.0.0.1", password: "password");
      expect(client.connection, isA<BasicAuthClient>());
    });
  });
}
