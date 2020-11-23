// daap-client
// test/objects_test.dart

import "package:daapc/src/objects.dart";
import "package:daapc/src/constants.dart";
import "package:test/test.dart";

void main() {
  group(DmapCode, () {
    test("'toString' method must return DMAP code class string representation",
        () {
      final code = DmapCode("msrv", "dmap.serverinforesponse", container);
      expect(code.toString(),
          "<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>");
    }, tags: ["object"]);
  });
  group(DaapObject, () {});
}
