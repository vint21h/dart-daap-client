// daap-client
// test/objects_test.dart

import "package:daapc/src/objects.dart";
import "package:daapc/src/constants.dart";
import "package:test/test.dart";

void main() {
  group(DmapCode, () {
    test("'DmapCode' constructor must initialize DMAP code data", () {
      final code = DmapCode("msrv", "dmap.serverinforesponse", container);
      expect(code.code, "msrv");
      expect(code.name, "dmap.serverinforesponse");
      expect(code.type, container);
    }, tags: ["object"]);
    test("'toString' method must return DMAP code class string representation",
        () {
      final code = DmapCode("msrv", "dmap.serverinforesponse", container);
      expect(code.toString(),
          "<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>");
    }, tags: ["object"]);
  });
  group(DaapObject, () {});
}
