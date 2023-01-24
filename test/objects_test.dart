import "dart:typed_data";

import "package:daapc/daapc.dart";
import "package:test/test.dart";

void main() {
  group(DmapCode, () {
    test("'toString' method must return DMAP code class string representation",
        () {
      final code = DmapCode("msrv", "dmap.serverinforesponse", 12);
      expect(
          code.toString(),
          // ignore: lines_longer_than_80_chars
          "<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>");
    }, tags: ["objects", "DmapCode", "toString"]);
    test("'DmapCode' constructor must initialize object", () {
      final code = DmapCode("msrv", "dmap.serverinforesponse", 12);
      expect(code.code, "msrv");
      expect(code.name, "dmap.serverinforesponse");
      expect(code.type, 12);
    }, tags: ["objects", "DmapCode", "toString"]);
  });
  group(DaapObject, () {
    test(
        "'toString' method must return DAAP object class string representation",
        () {
      final data = Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final obj = DaapObject(data);
      expect(
          obj.toString(),
          // ignore: lines_longer_than_80_chars
          "<DaapObject: {code: '<DmapCode: {code: 'msrv', name: 'dmap.serverinforesponse', type: 'container (c)'}>', value: '[]', length: '0'}>");
    }, tags: ["objects", "DaapObject", "toString"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getCode' method must return DMAP code class with type corresponding to type in data",
        () {
      final data = Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final obj = DaapObject(data);
      expect(obj.getCode(data), dmapCodeTypes["msrv"]);
    }, tags: ["objects", "DaapObject", "getCode"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getCode' method must raise 'DmapDecodeException' when found unknown DMAP code",
        () {
      final data = Uint8List.fromList([116, 101, 115, 116, 0, 0, 0, 0]);
      try {
        DaapObject(data);
      } on DmapDecodeException catch (error) {
        expect(
            error,
            TypeMatcher<DmapDecodeException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DmapObject: decode data error. 'test' was not found in actual DMAP codes list."));
        return;
      }
      throw Exception("Expected DmapDecodeException");
    }, tags: ["objects", "DaapObject", "getCode"]);
    test("'getDataLength' method must return DAAP object data length", () {
      final data = Uint8List.fromList([109, 115, 114, 118, 0, 0, 0, 0]);
      final obj = DaapObject(data);
      expect(obj.getDataLength(data), 0);
    }, tags: ["objects", "DaapObject", "getDataLength"]);
    test("'getVersion' method must return DAAP protocol version", () {
      final data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final obj = DaapObject(data);
      expect(obj.getVersion(Uint8List.fromList([0, 3, 0, 0])), "3.0");
    }, tags: ["objects", "DaapObject", "getVersion"]);
    test("'value' getter must return DAAP object 'byte' type value", () {
      final data = Uint8List.fromList([109, 115, 97, 117, 0, 0, 0, 1, 0]);
      final obj = DaapObject(data);
      expect(obj.value, 0);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'unsignedByte' type value",
        () {
      final data = Uint8List.fromList([97, 115, 114, 118, 0, 0, 0, 1, 0]);
      final obj = DaapObject(data);
      expect(obj.value, 0);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'short' type value", () {
      final data = Uint8List.fromList([109, 99, 116, 121, 0, 0, 0, 2, 0, 10]);
      final obj = DaapObject(data);
      expect(obj.value, 10);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'integer' type value", () {
      final data =
          Uint8List.fromList([109, 115, 116, 116, 0, 0, 0, 4, 0, 0, 0, 200]);
      final obj = DaapObject(data);
      expect(obj.value, 200);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'unsignedInteger' type value",
        () {
      final data =
          Uint8List.fromList([109, 115, 116, 111, 0, 0, 0, 4, 0, 0, 0, 10]);
      final obj = DaapObject(data);
      expect(obj.value, 10);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'long' type value", () {
      final data = Uint8List.fromList(
          [109, 112, 101, 114, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 10]);
      final obj = DaapObject(data);
      expect(obj.value, 10);
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'string' type value", () {
      final data = Uint8List.fromList(
          [109, 105, 110, 109, 0, 0, 0, 4, 116, 101, 115, 116]);
      final obj = DaapObject(data);
      expect(obj.value, "test");
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'timestamp' type value", () {
      final data =
          Uint8List.fromList([109, 115, 116, 99, 0, 0, 0, 4, 0, 0, 0, 0]);
      final obj = DaapObject(data);
      expect(obj.value, DateTime.utc(1970, 1, 1));
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'version' type value", () {
      final data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final obj = DaapObject(data);
      expect(obj.value, "3.0");
    }, tags: ["objects", "DaapObject", "value"]);
    test("'value' getter must return DAAP object 'container' type value", () {
      final data = Uint8List.fromList([
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
      final obj = DaapObject(data);
      expect(
          obj.value.toString(),
          [
            DaapObject(Uint8List.fromList(
                [109, 115, 116, 116, 0, 0, 0, 4, 0, 0, 0, 200]))
          ].toString());
    }, tags: ["objects", "DaapObject", "value"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'value' getter must throw 'DmapDecodeException' for unknown DMAP code type",
        () {
      final data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final obj = DaapObject(data);
      obj.code = DmapCode("test", "com.example", 13);
      try {
        obj.value;
      } on DmapDecodeException catch (error) {
        expect(
            error,
            TypeMatcher<DmapDecodeException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DmapObject: decode data error. Unknown DMAP code type: '13'."));
        return;
      }
      throw Exception("Expected DmapDecodeException");
    }, tags: ["objects", "DaapObject", "value"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'decode' method must raise 'DmapDecodeException' when data length is less than 8 bytes",
        () {
      final data = Uint8List.fromList([109, 115, 114, 118, 0, 0, 0]);
      try {
        DaapObject(data);
      } on DmapDecodeException catch (error) {
        expect(
            error,
            TypeMatcher<DmapDecodeException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DmapObject: decode data error. Code name length must be at least 8 bytes"));
        return;
      }
      throw Exception("Expected DmapDecodeException");
    }, tags: ["objects", "DaapObject", "decode"]);
    test("'getAtom' method must return DAAP object value found by code name",
        () {
      final data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final obj = DaapObject(data);
      expect(obj.getAtom("apro"), "3.0");
    }, tags: ["objects", "DaapObject", "getAtom"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getAtom' method must return DAAP object value found by code name (recursive case)",
        () {
      final data = Uint8List.fromList([
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
      final obj = DaapObject(data);
      expect(obj.getAtom("mstt"), 200);
    }, tags: ["objects", "DaapObject", "getAtom"]);
    test(
        // ignore: lines_longer_than_80_chars
        "'getAtom' method must raise 'DmapDecodeException' for unknown DMAP code",
        () {
      final data =
          Uint8List.fromList([97, 112, 114, 111, 0, 0, 0, 4, 0, 3, 0, 0]);
      final obj = DaapObject(data);
      try {
        obj.getAtom("test");
      } on DmapDecodeException catch (error) {
        expect(
            error,
            TypeMatcher<DmapDecodeException>().having(
                (error) => error.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                "DmapObject: decode data error. 'test' was not found in actual DMAP codes list."));
        return;
      }
      throw Exception("Expected DmapDecodeException");
    }, tags: ["objects", "DaapObject", "getAtom"]);
    test("'getTimestamp' method must return DAAP timestamp", () {
      final data =
          Uint8List.fromList([109, 115, 116, 99, 0, 0, 0, 4, 0, 0, 0, 0]);
      final obj = DaapObject(data);
      expect(obj.getTimestamp(Uint8List.fromList([0, 0, 0, 0])),
          DateTime.utc(1970, 1, 1));
    }, tags: ["objects", "DaapObject", "getTimestamp"]);
  });
}
