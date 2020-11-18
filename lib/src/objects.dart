// daap-client
// lib/src/objects.dart

import "dart:convert";
import "dart:typed_data";

import "constants.dart";
import "exceptions.dart";

/// DMAP code.
class DmapCode {
  String name;
  int type;

  DmapCode(this.name, this.type);

  /// Creates DMAP code class string representation.
  @override
  String toString() {
    return "<DmapCode: {name: '${this.name}', type: '${dmapDataTypes[this.type]}'}>";
  }
}

/// DAAP object.
class DaapObject {
  DmapCode code;
  int dataLength;
  List<DaapObject> contains;

  /// DAAP object constructor.
  DaapObject(Uint8List data) {
    this.decode(data);
  }

  /// Creates DAAP object class string representation.
  @override
  String toString() {
    return "<DaapObject: {code: '${this.code.toString()}'}>";
  }

  /// Decodes DAAP server response to DAAP object.
  ///
  /// Throws an exception in case of broken data.
  /// Gets object code and type.
  void decode(Uint8List data) {
    if (data.lengthInBytes < 8) {
      // broken data, must contain at least 8 bytes
      throw DaapDecodeException();
    }

    this.code = this.getCode(data);
    this.dataLength = this.getDataLength(data);

    if (this.code.type == container) {}
  }

  /// Get DAAP object DMAP code from data.
  DmapCode getCode(Uint8List data) {
    String code =
      utf8.decode(data.sublist(0, 4)); // first 4 bytes is object code
    return dmapCodeTypes[code];
  }

  /// Get DAAP object data length.
  int getDataLength(Uint8List data) {
    return ByteData.view(data.sublist(4, 8).buffer)
        .getInt32(0);  // bytes 5-8 is length of object data
  }
}
