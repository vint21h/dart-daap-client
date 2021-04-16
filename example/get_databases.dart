// dart-daap-client
// example/get_databases.dart

import "dart:io" show Platform, stdout;

import "package:daapc/daapc.dart";

/// Get databases list from the server.
///
/// Usually it will be only one per server and this name
/// depends on server protocol implementation
/// (for example "Rhythmbox" "DAAP Music Sharing" plugin
/// uses hostname as default if it is not configured),
/// but it may be possible to have multiple.
void main() async {
  var envVars = Platform.environment;
  var client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  var databases = await client.getDatabases();
  for (DaapObject db in databases.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    stdout.writeln(
        // ignore: lines_longer_than_80_chars
        '${db.getAtom(DMAP_CODE_DMAP_ITEMID)}: ${db.getAtom(DMAP_CODE_DMAP_ITEMNAME)}');
  }
}
