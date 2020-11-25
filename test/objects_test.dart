// daap-client
// test/objects_test.dart

import "package:test/test.dart";
import "dart:typed_data";

import "package:daapc/src/objects.dart";
import "package:daapc/src/constants.dart";
import "package:daapc/src/exceptions.dart";

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
  group(DaapObject, () {
    test("'toString' method must return DAAP object class string representation",
        () {
      final Uint8List data = Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.toString(),
          "<DaapObject: {code: '<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["object"]);
    test("'decode' method must raise 'DaapDecodeException' when data length is less than 8 bytes",
        () {
      final Uint8List data = Uint8List.fromList([109, 115, 114, 118, 0, 0, 0]);
      try {
        DaapObject(data);
      } on DaapDecodeException catch(error) {
        expect(error, TypeMatcher<DaapDecodeException>());
        return;
      }
      throw Exception("Expected DaapDecodeException");
    }, tags: ["object"]);
  });
}
