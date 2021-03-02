// dart-daap-client
// lib/src/exceptions.dart

/// DAAP client auth required exception.
class DaapAuthRequiredException implements Exception {
  String errMsg() => "DaapClient: auth required.";
}

/// DAAP client authentication failure exception.
class DaapAuthenticationFailureException implements Exception {
  String errMsg() => "DaapClient: authentication failure.";
}

/// DAAP client too many connections exception.
class DaapTooManyConnectionsException implements Exception {
  String errMsg() => "DaapClient: too many connections.";
}

/// DAAP client common exception.
class DaapException implements Exception {
  final String message;
  const DaapException(this.message);
  String toString() => "DaapClient: making request error. ${message}";
}

/// DMAP decode data exception.
class DmapDecodeException implements Exception {
  final String message;
  const DmapDecodeException(this.message);
  String toString() => "DmapObject: decode data error. ${message}";
}

/// DMAP encode data exception.
class DmapEncodeException implements Exception {
  final String message;
  const DmapEncodeException(this.message);
  String toString() => "DmapObject: encode data error. ${message}";
}
