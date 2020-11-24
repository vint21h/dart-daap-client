// daap-client
// test/objects_test.dart

import "package:test/test.dart";

import "package:daapc/src/objects.dart";
import "package:daapc/src/constants.dart";

import "fixtures.dart";

void main() {
  group(DmapCode, () {
    test("'toString' method must return DMAP code class string representation",
        () {
      final code = DmapCode("msrv", "dmap.serverinforesponse", container);
      expect(code.toString(),
          "<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>");
    }, tags: ["object"]);
    test("'type' getter must return DMAP code type property", () {
      final code = DmapCode("msrv", "dmap.serverinforesponse", container);
      expect(code.type, container);
    }, tags: ["object"]);
  });
  group(DaapObject, () {});
}
