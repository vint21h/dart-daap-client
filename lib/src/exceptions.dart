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
  String errMsg() => "DaapClient: making request error.";
}

/// DAAP client decode data exception.
class DaapDecodeException implements Exception {
  String errMsg() => "DaapClient: decode data error.";
}
