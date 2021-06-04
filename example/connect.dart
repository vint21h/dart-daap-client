// dart-daap-client
// example/connect.dart

import "dart:io" show Platform;

import "package:daapc/daapc.dart";

/// Connect to the server:
/// 1. Get server info
/// 2. Get server content codes data
/// 3. Login to server
/// and saves all server responses for the future use.
void main() async {
  var envVars = Platform.environment;
  var client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
  await client.connect();
}
