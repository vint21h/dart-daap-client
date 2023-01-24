import "dart:convert";
import "dart:typed_data";

import "constants.dart";
import "exceptions.dart";

/// DMAP code.
class DmapCode {
  /// DMAP code
  String code = "";

  /// DMAP code name
  String name = "";

  /// DMAP type
  int type = 0;

  /// DMAP code object constructor.
  DmapCode(String code, String name, int type) {
    this.code = code; // ignore: prefer_initializing_formals
    this.name = name; // ignore: prefer_initializing_formals
    this.type = type; // ignore: prefer_initializing_formals
  }

  /// Creates DMAP code class string representation.
  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return "<DmapCode: {code: '$code', name: '$name', type: '${dmapDataTypesNames[type]} (${dmapDataTypes[type]})'}>";
  }
}

/// DAAP object.
class DaapObject {
  /// DMAP code
  DmapCode code = DmapCode("", "", 0);

  /// object raw data
  Uint8List rawData = Uint8List.fromList([]);
  int _dataLength = 0;

  // DAAP object value representation in corresponding data types.
  int _value__byte = 0; // ignore: non_constant_identifier_names
  int _value__unsignedByte = 0; // ignore: non_constant_identifier_names
  int _value__short = 0; // ignore: non_constant_identifier_names
  int _value__unsignedShort = 0; // ignore: non_constant_identifier_names
  int _value__integer = 0; // ignore: non_constant_identifier_names
  int _value__unsignedInteger = 0; // ignore: non_constant_identifier_names
  int _value__long = 0; // ignore: non_constant_identifier_names
  int _value__unsignedLong = 0; // ignore: non_constant_identifier_names
  String _value__string = ""; // ignore: non_constant_identifier_names
  DateTime? _value__timestamp; // ignore: non_constant_identifier_names
  String _value__version = ""; // ignore: non_constant_identifier_names
  List<DaapObject>
      _value__container = // ignore: non_constant_identifier_names, prefer_final_fields
      [];

  /// DAAP object constructor.
  DaapObject(Uint8List data) {
    decode(data);
  }

  /// Creates DAAP object class string representation.
  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return "<DaapObject: {code: '${code.toString()}', value: '$value', length: '$_dataLength'}>";
  }

  /// DAAP object value getter.
  ///
  /// Return corresponding data type value.
  dynamic get value {
    switch (code.type) {
      case byte:
        return _value__byte;
      case unsignedByte:
        return _value__unsignedByte;
      case short:
        return _value__short;
      case unsignedShort:
        return _value__unsignedShort;
      case integer:
        return _value__integer;
      case unsignedInteger:
        return _value__unsignedInteger;
      case long:
        return _value__long;
      case unsignedLong:
        return _value__unsignedLong;
      case string:
        return _value__string;
      case timestamp:
        return _value__timestamp;
      case version:
        return _value__version;
      case container:
        return _value__container;
    }
    throw DmapDecodeException("Unknown DMAP code type: '${code.type}'.");
  }

  /// Search appropriate object value by code name in object tree.
  ///
  /// Throws [DmapDecodeException] in case of unknown code.
  dynamic getAtom(String code) {
    if (dmapCodeTypes.containsKey(code)) {
      var dmapCode = dmapCodeTypes[code]!;
      if (this.code == dmapCode) {
        if (this.code.type == container) {
          return this;
        }
        return value;
      }
      // check children
      if ((this.code.type == container) && value.length > 0) {
        for (var object in value) {
          var value = object.getAtom(code);
          if (value != null) {
            return value;
          }
        }
      }
      return null;
    } else {
      throw DmapDecodeException(
          "'$code' was not found in actual DMAP codes list.");
    }
  }

  /// Decodes DAAP server response to DAAP object.
  ///
  /// Gets object code, type and value.
  /// Throws [DmapDecodeException] in case of broken data.
  void decode(Uint8List data) {
    if (data.lengthInBytes < 8) {
      // broken data, must contain at least 8 bytes
      throw DmapDecodeException("Code name length must be at least 8 bytes");
    }

    code = getCode(data);
    _dataLength = getDataLength(data);
    rawData = data.sublist(
        8, 8 + getDataLength(data)); // skip (code + data length) offset

    switch (code.type) {
      case byte:
        _value__byte = ByteData.view(rawData.buffer).getInt8(0);
        break;
      case unsignedByte:
        _value__unsignedByte = ByteData.view(rawData.buffer).getUint8(0);
        break;
      case short:
        _value__short = ByteData.view(rawData.buffer).getInt16(0);
        break;
      case unsignedShort:
        _value__unsignedShort = ByteData.view(rawData.buffer).getUint16(0);
        break;
      case integer:
        _value__integer = ByteData.view(rawData.buffer).getInt32(0);
        break;
      case unsignedInteger:
        _value__unsignedInteger = ByteData.view(rawData.buffer).getUint32(0);
        break;
      case long:
        _value__long = ByteData.view(rawData.buffer).getInt64(0);
        break;
      case unsignedLong:
        _value__unsignedLong = ByteData.view(rawData.buffer).getUint64(0);
        break;
      case string:
        _value__string = utf8.decode(rawData);
        break;
      case timestamp:
        _value__timestamp = getTimestamp(rawData);
        break;
      case version:
        _value__version = getVersion(rawData);
        break;
      case container:
        var chunkStart = 0;
        while (chunkStart + 8 < _dataLength) {
          // including (code + data length) offset
          var obj = DaapObject(rawData.sublist(chunkStart));
          chunkStart = chunkStart +
              obj.rawData.lengthInBytes +
              8; // including (code + data length) offset
          _value__container.add(obj);
        }
        break;
    }
  }

  /// Get DAAP object DMAP code from data.
  ///
  /// Get and return appropriate DMAP code object.
  /// Throws [DmapDecodeException] in case of unknown code.
  DmapCode getCode(Uint8List data) {
    var code = utf8.decode(data.sublist(0, 4)); // first 4 bytes is object code
    if (dmapCodeTypes.containsKey(code)) {
      return dmapCodeTypes[code]!;
    } else {
      throw DmapDecodeException(
          "'$code' was not found in actual DMAP codes list.");
    }
  }

  /// Get DAAP object data length.
  int getDataLength(Uint8List data) {
    return ByteData.view(data.sublist(4, 8).buffer)
        .getInt32(0, Endian.big); // bytes 5...8 is length of object data
  }

  /// Get DAAP protocol version.
  String getVersion(Uint8List data) {
    // generally version is two short unsigned integers
    // ignore: lines_longer_than_80_chars
    return "${ByteData.view(data.buffer, 0, 2).getUint16(0)}.${ByteData.view(data.buffer, 2, 2).getUint16(0)}";
  }

  /// Get DAAP timestamp data type value.
  DateTime getTimestamp(Uint8List data) {
    var millisecondsTimestamp = ByteData.view(data.buffer).getInt32(0) * 1000;
    return DateTime.fromMillisecondsSinceEpoch(millisecondsTimestamp).toUtc();
  }
}
