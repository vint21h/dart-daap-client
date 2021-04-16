// dart-daap-client
// examples/init.dart

import "dart:io" show Platform;

import "package:daapc/daapc.dart";

/// Just create DAAP client class instance
/// and provide server host and password if it is necessary.
void main() async {
  var envVars = Platform.environment;
  // ignore: unused_local_variable
  var client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
}
