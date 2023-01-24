/// DAAP client auth required exception.
class DaapAuthRequiredException implements Exception {
  /// Error message method.
  String errMsg() => "DaapClient: auth required.";
}

/// DAAP client authentication failure exception.
class DaapAuthenticationFailureException implements Exception {
  /// Error message method.
  String errMsg() => "DaapClient: authentication failure.";
}

/// DAAP client too many connections exception.
class DaapTooManyConnectionsException implements Exception {
  /// Error message method.
  String errMsg() => "DaapClient: too many connections.";
}

/// DAAP client common exception.
class DaapException implements Exception {
  /// Error message.
  final String message;

  /// Constructor.
  const DaapException(this.message);
  String toString() => "DaapClient: making request error. $message";
}

/// DMAP decode data exception.
class DmapDecodeException implements Exception {
  /// Error message.
  final String message;

  /// Constructor.
  const DmapDecodeException(this.message);
  String toString() => "DmapObject: decode data error. $message";
}

/// DMAP encode data exception.
class DmapEncodeException implements Exception {
  /// Error message.
  final String message;

  /// Constructor.
  const DmapEncodeException(this.message);
  String toString() => "DmapObject: encode data error. $message";
}

/// DMAP object improperly configured exception.
class DmapImproperlyConfiguredException implements Exception {
  /// Error message.
  final String message;

  /// Constructor.
  const DmapImproperlyConfiguredException(this.message);
  String toString() => "DmapObject: improperly configured. $message";
}

/// DAAP client improperly configured exception.
class DaapImproperlyConfiguredException implements Exception {
  /// Error message.
  final String message;

  /// Constructor.
  const DaapImproperlyConfiguredException(this.message);
  String toString() => "DaapClient: improperly configured. $message";
}
