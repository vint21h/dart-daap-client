// daap-client
// lib/src/objects.dart

import "dart:convert";
import "dart:typed_data";

import "constants.dart";
import "exceptions.dart";

/// DMAP code.
class DmapCode {
  String code;
  String name;
  int type;

  /// DMAP code object constructor.
  DmapCode(this.code, this.name, this.type);

  /// Creates DMAP code class string representation.
  @override
  String toString() {
    return "<DmapCode: {code: '${this.code}', name: '${this.name}', type: '${dmapDataTypesNames[this.type]} (${dmapDataTypes[this.type]})'}>";
  }
}

/// DAAP object.
class DaapObject {
  // TODO: write tests!!1
  DmapCode code;
  int dataLength;
  Uint8List rawData;

  // DAAP object value representation in corresponding data types.
  int _value__byte;
  int _value__unsignedByte;
  int _value__short;
  int _value__unsignedShort;
  int _value__integer;
  int _value__unsignedInteger;
  int _value__long;
  int _value__unsignedLong;
  String _value__string;
  double _value__timestamp;
  int _value__version;
  List<DaapObject> _value__container = [];

  /// DAAP object constructor.
  DaapObject(Uint8List data) {
    this.decode(data);
  }

  /// Creates DAAP object class string representation.
  @override
  String toString() {
    return "<DaapObject: {code: '${this.code.toString()}', value: '${this.value}'}>";
  }

  /// DAAP object value getter.
  ///
  /// Return corresponding data type value.
  dynamic get value {
    if (this.code.type == byte) {
      return this._value__byte;
    } else if (this.code.type == unsignedByte) {
      return this._value__unsignedByte;
    } else if (this.code.type == short) {
      return this._value__short;
    } else if (this.code.type == unsignedShort) {
      return this._value__unsignedShort;
    } else if (this.code.type == integer) {
      return this._value__integer;
    } else if (this.code.type == unsignedInteger) {
      return this._value__unsignedInteger;
    } else if (this.code.type == long) {
      return this._value__long;
    } else if (this.code.type == unsignedLong) {
      return this._value__unsignedLong;
    } else if (this.code.type == string) {
      return this._value__string;
    } else if (this.code.type == timestamp) {
      return this._value__timestamp;
    } else if (this.code.type == version) {
      return this._value__version;
    } else if (this.code.type == container) {
      return this._value__container;
    }
  }

  /// Decodes DAAP server response to DAAP object.
  ///
  /// Gets object code, type and value.
  /// Throws "DaapDecodeException" in case of broken data.
  void decode(Uint8List data) {
    if (data.lengthInBytes < 8) {
      // broken data, must contain at least 8 bytes
      throw DaapDecodeException();
    }

    this.code = this.getCode(data);
    this.dataLength = this.getDataLength(data);
    this.rawData = data.sublist(
        8, 8 + this.getDataLength(data)); // skip code + data length offset

    if (this.code.type == byte) {
      this._value__byte = ByteData.view(rawData.buffer).getInt8(0);
    } else if (this.code.type == unsignedByte) {
      this._value__unsignedByte = ByteData.view(rawData.buffer).getUint8(0);
    } else if (this.code.type == short) {
      this._value__short = ByteData.view(rawData.buffer).getInt16(0);
    } else if (this.code.type == unsignedShort) {
      this._value__unsignedShort = ByteData.view(rawData.buffer).getUint16(0);
    } else if (this.code.type == integer) {
      this._value__integer = ByteData.view(rawData.buffer).getInt32(0);
    } else if (this.code.type == unsignedInteger) {
      this._value__unsignedInteger = ByteData.view(rawData.buffer).getUint32(0);
    } else if (this.code.type == long) {
      this._value__long = ByteData.view(rawData.buffer).getInt64(0);
    } else if (this.code.type == unsignedLong) {
      this._value__unsignedLong = ByteData.view(rawData.buffer).getUint64(0);
    } else if (this.code.type == string) {
      this._value__string = utf8.decode(rawData);
    } else if (this.code.type == timestamp) {
      this._value__timestamp = ByteData.view(rawData.buffer).getFloat32(0);
    } else if (this.code.type == version) {
      this._value__version = ByteData.view(rawData.buffer).getUint32(0);
    } else if (this.code.type == container) {
      int chunkStart = 0;
      while (chunkStart + 8 < this.dataLength) {
        // including code + data length offset
        DaapObject obj = DaapObject(this.rawData.sublist(chunkStart));
        chunkStart = chunkStart +
            obj.rawData.lengthInBytes +
            8; // including code + data length offset
        this._value__container.add(obj);
      }
    }
  }

  /// Get DAAP object DMAP code from data.
  ///
  /// Get and return appropriate DMAP code.
  /// Throws "DaapDecodeException" in case of unknown code.
  DmapCode getCode(Uint8List data) {
    String code =
        utf8.decode(data.sublist(0, 4)); // first 4 bytes is object code
    if (dmapCodeTypes.containsKey(code)) {
      return dmapCodeTypes[code];
    } else {
      throw DaapDecodeException();
    }
  }

  /// Get DAAP object data length.
  int getDataLength(Uint8List data) {
    return ByteData.view(data.sublist(4, 8).buffer)
        .getInt32(0, Endian.big); // bytes 5...8 is length of object data
  }
}
