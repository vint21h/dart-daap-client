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
    }, tags: ["objects", "DmapCode", "toString"]);
    test("'type' getter must return DMAP code type property", () {
      final code = DmapCode("msrv", "dmap.serverinforesponse", container);
      expect(code.type, container);
    }, tags: ["objects", "DmapCode", "type"]);
  });
  group(DaapObject, () {
    test(
        "'toString' method must return DAAP object class string representation",
        () {
      final Uint8List data =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.toString(),
          "<DaapObject: {code: '<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["objects", "DaapObject", "toString"]);
    test(
        "'getCode' method must return DMAP code class with type corresponding to type in data",
        () {
      final Uint8List data =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.getCode(data), dmapCodeTypes["msrv"]);
    }, tags: ["objects", "DaapObject", "getCode"]);
    test(
        "'getCode' method must raise 'DaapDecodeException' when when found unknown DMAP code",
        () {
      final Uint8List data =
          Uint8List.fromList([116, 101, 115, 116, 0, 0, 0, 0]);
      try {
        DaapObject(data);
      } on DaapDecodeException catch (error) {
        expect(error, TypeMatcher<DaapDecodeException>());
        return;
      }
      throw Exception("Expected DaapDecodeException");
    }, tags: ["objects", "DaapObject", "getCode"]);
    test("'getDataLength' method must return DAAP object data length", () {
      final Uint8List data =
          Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.getDataLength(data), 0);
    }, tags: ["objects", "DaapObject", "getDataLength"]);
    test("'getVersion' method must return DAAP protocol version", () {
      final Uint8List data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.getVersion(Uint8List.fromList([0, 3, 0, 0])), "3.0");
    }, tags: ["objects", "DaapObject", "getVersion"]);
    test("'value' getter must return DAAP object 'byte' type value", () {
      final Uint8List data =
          Uint8List.fromList([109, 115, 97, 117, 0, 0, 0, 1, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, 0);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'unsignedByte' type value",
        () {
      final Uint8List data =
          Uint8List.fromList([97, 115, 114, 118, 0, 0, 0, 1, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, 0);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'short' type value", () {
      final Uint8List data =
          Uint8List.fromList([109, 99, 116, 121, 0, 0, 0, 2, 0, 10]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, 10);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'integer' type value", () {
      final Uint8List data =
          Uint8List.fromList([109, 115, 116, 116, 0, 0, 0, 4, 0, 0, 0, 200]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, 200);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'unsignedInteger' type value",
        () {
      final Uint8List data =
          Uint8List.fromList([109, 115, 116, 111, 0, 0, 0, 4, 0, 0, 0, 10]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, 10);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'long' type value", () {
      final Uint8List data = Uint8List.fromList(
          [109, 112, 101, 114, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 10]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, 10);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'string' type value", () {
      final Uint8List data = Uint8List.fromList(
          [109, 105, 110, 109, 0, 0, 0, 4, 116, 101, 115, 116]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, "test");
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'timestamp' type value", () {
      final Uint8List data =
          Uint8List.fromList([109, 115, 116, 99, 0, 0, 0, 4, 0, 0, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, DateTime.utc(1970, 1, 1));
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'version' type value", () {
      final Uint8List data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.value, "3.0");
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'container' type value", () {
      final Uint8List data = Uint8List.fromList([
        109,
        108,
        111,
        103,
        0,
        0,
        0,
        12,
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
        200
      ]);
      final DaapObject obj = DaapObject(data);
      expect(
          obj.value.toString(),
          [
            DaapObject(Uint8List.fromList(
                [109, 115, 116, 116, 0, 0, 0, 4, 0, 0, 0, 200]))
          ].toString());
    }, tags: ["objects", "DaapObject", "value"]);
    test(
        "'decode' method must raise 'DaapDecodeException' when data length is less than 8 bytes",
        () {
      final Uint8List data = Uint8List.fromList([109, 115, 114, 118, 0, 0, 0]);
      try {
        DaapObject(data);
      } on DaapDecodeException catch (error) {
        expect(error, TypeMatcher<DaapDecodeException>());
        return;
      }
      throw Exception("Expected DaapDecodeException");
    }, tags: ["objects", "DaapObject", "decode"]);
    test("'getAtom' method must return DAAP object value found by code name",
        () {
      final Uint8List data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.getAtom("apro"), "3.0");
    }, tags: ["objects", "DaapObject", "getAtom"]);
    test(
        "'getAtom' method must return DAAP object value found by code name (recursive case)",
        () {
      final Uint8List data = Uint8List.fromList([
        109,
        108,
        111,
        103,
        0,
        0,
        0,
        12,
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
        200
      ]);
      final DaapObject obj = DaapObject(data);
      expect(obj.getAtom("mstt"), 200);
    }, tags: ["objects", "DaapObject", "getAtom"]);
    test(
        "'getAtom' method must raise 'DaapDecodeException' for unknown DMAP code",
        () {
      final Uint8List data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final DaapObject obj = DaapObject(data);
      try {
        obj.getAtom("test");
      } on DaapDecodeException catch (error) {
        expect(error, TypeMatcher<DaapDecodeException>());
        return;
      }
      throw Exception("Expected DaapDecodeException");
    }, tags: ["objects", "DaapObject", "getAtom"]);
    test("'getTimestamp' method must return DAAP timestamp", () {
      final Uint8List data =
          Uint8List.fromList([109, 115, 116, 99, 0, 0, 0, 4, 0, 0, 0, 0]);
      final DaapObject obj = DaapObject(data);
      expect(obj.getTimestamp(Uint8List.fromList([0, 0, 0, 0])),
          DateTime.utc(1970, 1, 1));
    }, tags: ["objects", "DaapObject", "getTimestamp"]);
  });
}
