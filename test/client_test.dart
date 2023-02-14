import "dart:io";
import "dart:typed_data";

import "package:daapc/daapc.dart";
import "package:http/http.dart";
import "package:http_auth/http_auth.dart";
import "package:nock/nock.dart";
import "package:test/test.dart";

void main() {
  setUpAll(nock.init);
  setUp(nock.cleanAll);
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
        // ignore: lines_longer_than_80_chars
        "'toString' method must return formatted string with connection config with secured password",
        () {
      final client = DaapClient("127.0.0.1", password: "password");
      expect(client.toString(),
          "<DaapClient: {host: 127.0.0.1, port: 3689, password: ********}>");
    }, tags: ["client", "DaapClient", "toString"]);
    test("'headers' method must return dynamic request headers", () {
      final expected = <String, String>{
        "Client-DAAP-Version": "3.0",
        "Client-DAAP-Access-Index": "2",
        "User-Agent":
            "daapc/0.3.6 (https://github.com/vint21h/dart-daap-client/)",
        "Accept": "application/x-dmap-tagged",
        "Client-DAAP-Request-ID": "0",
      };
      final client = DaapClient("127.0.0.1");
      expect(client.headers, expected);
    }, tags: ["client", "DaapClient", "headers"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'headers' method must return dynamic request headers after multiple requests",
        () {
      final expected = <String, String>{
        "Client-DAAP-Version": "3.0",
        "Client-DAAP-Access-Index": "2",
        "User-Agent":
            "daapc/0.3.6 (https://github.com/vint21h/dart-daap-client/)",
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
        // ignore: lines_longer_than_80_chars
        "'connection' getter must return HTTP client class instance with basic authorization",
        () {
      final client = DaapClient("127.0.0.1", password: "password");
      expect(client.connection, isA<BasicAuthClient>());
    }, tags: ["client", "DaapClient", "connection"]);
    test("'request' method must return HTTP GET request result data", () async {
      final client = DaapClient("127.0.0.1");
      final url = Uri(
          scheme: "http", host: "127.0.0.1", port: 3689, path: "/server-info");
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, "");
      expect(await client.request(url), []);
    }, tags: ["client", "DaapClient", "request"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'request' method must raise 'DaapAuthRequiredException' when making GET HTTP request to server (authentication required case)",
        () {
      final client = DaapClient("127.0.0.1");
      final url = Uri(
          scheme: "http", host: "127.0.0.1", port: 3689, path: "/server-info");
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.unauthorized, "401 Unauthorized");
      expect(
          client.request(url),
          throwsA(isA<DaapAuthRequiredException>().having(
              (error) => error.errMsg(),
              "message",
              "DaapClient: auth required.")));
    }, tags: ["client", "DaapClient", "request"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'request' method must raise 'DaapAuthenticationFailureException' when making GET HTTP request to server (wrong credentials case)",
        () {
      final client = DaapClient("127.0.0.1");
      final url = Uri(
          scheme: "http", host: "127.0.0.1", port: 3689, path: "/server-info");
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.forbidden, "403 Forbidden");
      expect(
          client.request(url),
          throwsA(isA<DaapAuthenticationFailureException>().having(
              (error) => error.errMsg(),
              "message",
              "DaapClient: authentication failure.")));
    }, tags: ["client", "DaapClient", "request"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'request' method must raise 'DaapTooManyConnectionsException' when making GET HTTP request to server (server overloading case)",
        () {
      final client = DaapClient("127.0.0.1");
      final url = Uri(
          scheme: "http", host: "127.0.0.1", port: 3689, path: "/server-info");
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.serviceUnavailable, "503 Service Unavailable");
      expect(
          client.request(url),
          throwsA(isA<DaapTooManyConnectionsException>().having(
              (error) => error.errMsg(),
              "message",
              "DaapClient: too many connections.")));
    }, tags: ["client", "DaapClient", "request"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'request' method must raise 'DaapException' when making GET HTTP request to server (server unexpected response code case)",
        () {
      final client = DaapClient("127.0.0.1");
      final url = Uri(
          scheme: "http", host: "127.0.0.1", port: 3689, path: "/server-info");
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(500, "500 Internal Server Error");
      expect(
          client.request(url),
          throwsA(isA<DaapException>().having(
              (error) => error.toString(),
              "message",
              // ignore: lines_longer_than_80_chars
              "DaapClient: making request error. Response status: '500'. Response content: '500 Internal Server Error'.")));
    }, tags: ["client", "DaapClient", "request"]);
    test("'getContentCodes' method must return server content codes data",
        () async {
      final client = DaapClient("127.0.0.1");
      final data = Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/content-codes")
          .get("")
          .reply(HttpStatus.ok, data);
      var result = await client.getContentCodes();
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'mccr', name: 'dmap.contentcodesresponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getContentCodes"]);
    test("'getServerInfo' method must return server info data", () async {
      final client = DaapClient("127.0.0.1");
      final data = Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, data);
      var result = await client.getServerInfo();
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getServerInfo"]);
    test("'login' method must return session info data", () async {
      final client = DaapClient("127.0.0.1");
      final data = Uint8List.fromList([109, 108, 111, 103, 0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/login").get("").reply(HttpStatus.ok, data);
      var result = await client.login();
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'mlog', name: 'dmap.loginresponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "login"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'connect' method must get and store server info, server content codes and login data",
        () async {
      final client = DaapClient("127.0.0.1");
      final contentCodesData =
          Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);
      final serverInfoData =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final sessionInfoData =
          Uint8List.fromList([109, 108, 111, 103, 0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/content-codes")
          .get("")
          .reply(HttpStatus.ok, contentCodesData);
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, serverInfoData);
      nock("http://127.0.0.1:3689/login")
          .get("")
          .reply(HttpStatus.ok, sessionInfoData);
      await client.connect();
      expect(
          client.contentCodes.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'mccr', name: 'dmap.contentcodesresponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
      expect(
          client.serverInfo.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
      expect(
          client.sessionInfo.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'mlog', name: 'dmap.loginresponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "login"]);
    test("'getDatabases' method must return databases list from the server",
        () async {
      final client = DaapClient("127.0.0.1");
      final databasesData = Uint8List.fromList([97, 118, 100, 98, 0, 0, 0, 0]);
      final contentCodesData =
          Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);
      final serverInfoData =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final sessionInfoData = Uint8List.fromList([
        109,
        108,
        111,
        103,
        0,
        0,
        0,
        24,
        109,
        115,
        116,
        116,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        200,
        109,
        108,
        105,
        100,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0
      ]);
      nock("http://127.0.0.1:3689/databases?session-id=0")
          .get("")
          .reply(HttpStatus.ok, databasesData);
      nock("http://127.0.0.1:3689/content-codes")
          .get("")
          .reply(HttpStatus.ok, contentCodesData);
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, serverInfoData);
      nock("http://127.0.0.1:3689/login")
          .get("")
          .reply(HttpStatus.ok, sessionInfoData);
      await client.connect();
      var result = await client.getDatabases();
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'avdb', name: 'daap.serverdatabases', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getDatabases"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getDatabases' method must return databases list from the server (with sessionId arg case)",
        () async {
      final client = DaapClient("127.0.0.1");
      final databasesData = Uint8List.fromList([97, 118, 100, 98, 0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/databases?session-id=0")
          .get("")
          .reply(HttpStatus.ok, databasesData);
      var result = await client.getDatabases(sessionId: 0);
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'avdb', name: 'daap.serverdatabases', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getDatabases"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getDatabases' method must raise 'DaapImproperlyConfiguredException' in case of calling without 'sessionId' param before 'connect' call",
        () async {
      final client = DaapClient("127.0.0.1");
      try {
        await client.getDatabases();
      } on DaapImproperlyConfiguredException catch (error) {
        expect(
            error,
            TypeMatcher<DaapImproperlyConfiguredException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DaapClient: improperly configured. Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server."));
        return;
      }
      throw Exception("Expected DaapImproperlyConfiguredException");
    }, tags: ["client", "DaapClient", "getSongArtwork"]);
    test("'getDatabase' method must return database data from the server",
        () async {
      final client = DaapClient("127.0.0.1");
      final databaseData = Uint8List.fromList([97, 100, 98, 115, 0, 0, 0, 0]);
      final contentCodesData =
          Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);
      final serverInfoData =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final sessionInfoData = Uint8List.fromList([
        109,
        108,
        111,
        103,
        0,
        0,
        0,
        24,
        109,
        115,
        116,
        116,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        200,
        109,
        108,
        105,
        100,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0
      ]);
      nock("http://127.0.0.1:3689/databases/1/items?type=music&session-id=0&meta=dmap.itemid")
          .get("")
          .reply(HttpStatus.ok, databaseData);
      nock("http://127.0.0.1:3689/content-codes")
          .get("")
          .reply(HttpStatus.ok, contentCodesData);
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, serverInfoData);
      nock("http://127.0.0.1:3689/login")
          .get("")
          .reply(HttpStatus.ok, sessionInfoData);
      await client.connect();
      var result = await client.getDatabase(1, metaCodes: ["miid"]);
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'adbs', name: 'daap.databasesongs', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getDatabase"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getDatabase' method must return database data from the server (with sessionId arg case)",
        () async {
      final client = DaapClient("127.0.0.1");
      final databaseData = Uint8List.fromList([97, 100, 98, 115, 0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/databases/1/items?type=music&session-id=0&meta=dmap.itemid")
          .get("")
          .reply(HttpStatus.ok, databaseData);
      var result =
          await client.getDatabase(1, sessionId: 0, metaCodes: ["miid"]);
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'adbs', name: 'daap.databasesongs', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getDatabase"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getDatabase' method must raise 'DaapImproperlyConfiguredException' in case of calling without 'sessionId' param before 'connect' call",
        () async {
      final client = DaapClient("127.0.0.1");
      try {
        await client.getDatabase(1);
      } on DaapImproperlyConfiguredException catch (error) {
        expect(
            error,
            TypeMatcher<DaapImproperlyConfiguredException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DaapClient: improperly configured. Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server."));
        return;
      }
      throw Exception("Expected DaapImproperlyConfiguredException");
    }, tags: ["client", "DaapClient", "getDatabase"]);
    test("'getPlaylists' method must return database playlists from the server",
        () async {
      final client = DaapClient("127.0.0.1");
      final playlistsData = Uint8List.fromList([97, 112, 108, 121, 0, 0, 0, 0]);
      final contentCodesData =
          Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);
      final serverInfoData =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final sessionInfoData = Uint8List.fromList([
        109,
        108,
        111,
        103,
        0,
        0,
        0,
        24,
        109,
        115,
        116,
        116,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        200,
        109,
        108,
        105,
        100,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0
      ]);
      nock("http://127.0.0.1:3689/databases/1/containers?session-id=0&meta=dmap.itemid")
          .get("")
          .reply(HttpStatus.ok, playlistsData);
      nock("http://127.0.0.1:3689/content-codes")
          .get("")
          .reply(HttpStatus.ok, contentCodesData);
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, serverInfoData);
      nock("http://127.0.0.1:3689/login")
          .get("")
          .reply(HttpStatus.ok, sessionInfoData);
      await client.connect();
      var result = await client.getPlaylists(1, metaCodes: ["miid"]);
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'aply', name: 'daap.databaseplaylists', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getPlaylists"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getPlaylists' method must return database playlists from the server (with sessionId arg case)",
        () async {
      final client = DaapClient("127.0.0.1");
      final playlistsData = Uint8List.fromList([97, 112, 108, 121, 0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/databases/1/containers?session-id=0&meta=dmap.itemid")
          .get("")
          .reply(HttpStatus.ok, playlistsData);
      var result =
          await client.getPlaylists(1, sessionId: 0, metaCodes: ["miid"]);
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'aply', name: 'daap.databaseplaylists', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getPlaylists"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getPlaylists' method must raise 'DaapImproperlyConfiguredException' in case of calling without 'sessionId' param before 'connect' call",
        () async {
      final client = DaapClient("127.0.0.1");
      try {
        await client.getPlaylists(1);
      } on DaapImproperlyConfiguredException catch (error) {
        expect(
            error,
            TypeMatcher<DaapImproperlyConfiguredException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DaapClient: improperly configured. Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server."));
        return;
      }
      throw Exception("Expected DaapImproperlyConfiguredException");
    }, tags: ["client", "DaapClient", "getPlaylists"]);
    test("'getPlaylist' method must return playlist from the server", () async {
      final client = DaapClient("127.0.0.1");
      final playlistData = Uint8List.fromList([97, 112, 115, 111, 0, 0, 0, 0]);
      final contentCodesData =
          Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);
      final serverInfoData =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final sessionInfoData = Uint8List.fromList([
        109,
        108,
        111,
        103,
        0,
        0,
        0,
        24,
        109,
        115,
        116,
        116,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        200,
        109,
        108,
        105,
        100,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0
      ]);
      nock("http://127.0.0.1:3689/databases/1/containers/1/items?session-id=0&meta=dmap.itemid")
          .get("")
          .reply(HttpStatus.ok, playlistData);
      nock("http://127.0.0.1:3689/content-codes")
          .get("")
          .reply(HttpStatus.ok, contentCodesData);
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, serverInfoData);
      nock("http://127.0.0.1:3689/login")
          .get("")
          .reply(HttpStatus.ok, sessionInfoData);
      await client.connect();
      var result = await client.getPlaylist(1, 1, metaCodes: ["miid"]);
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'apso', name: 'daap.playlistsongs', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getPlaylist"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getPlaylist' method must return playlist from the server (with sessionId arg case)",
        () async {
      final client = DaapClient("127.0.0.1");
      final playlistData = Uint8List.fromList([97, 112, 115, 111, 0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/databases/1/containers/1/items?session-id=0&meta=dmap.itemid")
          .get("")
          .reply(HttpStatus.ok, playlistData);
      var result =
          await client.getPlaylist(1, 1, sessionId: 0, metaCodes: ["miid"]);
      expect(
          result.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'apso', name: 'daap.playlistsongs', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["client", "DaapClient", "getPlaylist"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getPlaylist' method must raise 'DaapImproperlyConfiguredException' in case of calling without 'sessionId' param before 'connect' call",
        () async {
      final client = DaapClient("127.0.0.1");
      try {
        await client.getPlaylist(1, 1);
      } on DaapImproperlyConfiguredException catch (error) {
        expect(
            error,
            TypeMatcher<DaapImproperlyConfiguredException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DaapClient: improperly configured. Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server."));
        return;
      }
      throw Exception("Expected DaapImproperlyConfiguredException");
    }, tags: ["client", "DaapClient", "getPlaylist"]);
    test("'getSong' method must return song data from the server", () async {
      final client = DaapClient("127.0.0.1");
      final songData = Uint8List.fromList([0, 0, 0, 0]);
      final contentCodesData =
          Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);
      final serverInfoData =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final sessionInfoData = Uint8List.fromList([
        109,
        108,
        111,
        103,
        0,
        0,
        0,
        24,
        109,
        115,
        116,
        116,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        200,
        109,
        108,
        105,
        100,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0
      ]);
      nock("http://127.0.0.1:3689/databases/1/items/42.mp3?session-id=0")
          .get("")
          .reply(HttpStatus.ok, songData);
      nock("http://127.0.0.1:3689/content-codes")
          .get("")
          .reply(HttpStatus.ok, contentCodesData);
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, serverInfoData);
      nock("http://127.0.0.1:3689/login")
          .get("")
          .reply(HttpStatus.ok, sessionInfoData);
      await client.connect();
      var result = await client.getSong(1, 42, "mp3");
      expect(result, Uint8List.fromList([0, 0, 0, 0]));
    }, tags: ["client", "DaapClient", "getSong"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getSong' method must return song data from the server (with sessionId arg case)",
        () async {
      final client = DaapClient("127.0.0.1");
      final songData = Uint8List.fromList([0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/databases/1/items/42.mp3?session-id=0")
          .get("")
          .reply(HttpStatus.ok, songData);
      var result = await client.getSong(1, 42, "mp3", sessionId: 0);
      expect(result, Uint8List.fromList([0, 0, 0, 0]));
    }, tags: ["client", "DaapClient", "getSong"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getSong' method must raise 'DaapImproperlyConfiguredException' in case of calling without 'sessionId' param before 'connect' call",
        () async {
      final client = DaapClient("127.0.0.1");
      try {
        await client.getSong(1, 42, "mp3");
      } on DaapImproperlyConfiguredException catch (error) {
        expect(
            error,
            TypeMatcher<DaapImproperlyConfiguredException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DaapClient: improperly configured. Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server."));
        return;
      }
      throw Exception("Expected DaapImproperlyConfiguredException");
    }, tags: ["client", "DaapClient", "getSong"]);
    test(
        "'getSongArtwork' method must return song artwork data from the server",
        () async {
      final client = DaapClient("127.0.0.1");
      final songArtworkData = Uint8List.fromList([0, 0, 0, 0]);
      final contentCodesData =
          Uint8List.fromList([109, 99, 99, 114, 0, 0, 0, 0]);
      final serverInfoData =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final sessionInfoData = Uint8List.fromList([
        109,
        108,
        111,
        103,
        0,
        0,
        0,
        24,
        109,
        115,
        116,
        116,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        200,
        109,
        108,
        105,
        100,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0
      ]);
      nock("http://127.0.0.1:3689/databases/1/items/42/extra_data/artwork?session-id=0")
          .get("")
          .reply(HttpStatus.ok, songArtworkData);
      nock("http://127.0.0.1:3689/content-codes")
          .get("")
          .reply(HttpStatus.ok, contentCodesData);
      nock("http://127.0.0.1:3689/server-info")
          .get("")
          .reply(HttpStatus.ok, serverInfoData);
      nock("http://127.0.0.1:3689/login")
          .get("")
          .reply(HttpStatus.ok, sessionInfoData);
      await client.connect();
      var result = await client.getSongArtwork(1, 42);
      expect(result, Uint8List.fromList([0, 0, 0, 0]));
    }, tags: ["client", "DaapClient", "getSongArtwork"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getSongArtwork' method must return song artwork data from the server (with sessionId arg case)",
        () async {
      final client = DaapClient("127.0.0.1");
      final songArtworkData = Uint8List.fromList([0, 0, 0, 0]);
      nock("http://127.0.0.1:3689/databases/1/items/42/extra_data/artwork?session-id=0")
          .get("")
          .reply(HttpStatus.ok, songArtworkData);
      var result = await client.getSongArtwork(1, 42, sessionId: 0);
      expect(result, Uint8List.fromList([0, 0, 0, 0]));
    }, tags: ["client", "DaapClient", "getSongArtwork"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getSongArtwork' method must raise 'DaapImproperlyConfiguredException' in case of calling without 'sessionId' param before 'connect' call",
        () async {
      final client = DaapClient("127.0.0.1");
      try {
        await client.getSongArtwork(1, 42);
      } on DaapImproperlyConfiguredException catch (error) {
        expect(
            error,
            TypeMatcher<DaapImproperlyConfiguredException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DaapClient: improperly configured. Can't get 'sessionId' from 'sessionInfo'. First, try to connect to the server."));
        return;
      }
      throw Exception("Expected DaapImproperlyConfiguredException");
    }, tags: ["client", "DaapClient", "getSongArtwork"]);
    test("'getRequestMeta' method must return request meta key value", () {
      final client = DaapClient("127.0.0.1");
      expect(client.getRequestMeta(["asaa", "asar"]),
          "daap.songalbumartist,daap.songartist");
    }, tags: ["client", "DaapClient", "getRequestMeta"]);
    test(
        // ignore: lines_longer_than_80_chars
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
                // ignore: lines_longer_than_80_chars
                "DmapObject: encode data error. 'test' was not found in actual DMAP codes list."));
        return;
      }
      throw Exception("Expected DmapDecodeException");
    }, tags: ["client", "DaapClient", "getRequestMeta"]);
  });
}
