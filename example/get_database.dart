// dart-daap-client
// example/get_database.dart

import "dart:io" show Platform, stdout;

import "package:daapc/daapc.dart";

/// Get database songs from the server.
///
/// [DaapClient.getDatabase] method [metaCodes] param used to get
/// only necessary songs attributes and reduce memory usage.
/// By default equals to [databaseQueryDefaultMetaCodes].
void main() async {
  var envVars = Platform.environment;
  var client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  var database = await client.getDatabase(1, metaCodes: [
    DMAP_CODE_DAAP_SONGTRACKNUMBER,
    DMAP_CODE_DMAP_ITEMNAME,
    DMAP_CODE_DAAP_SONGARTIST,
    DMAP_CODE_DAAP_SONGALBUM,
    DMAP_CODE_DAAP_SONGYEAR,
    DMAP_CODE_DAAP_SONGTIME,
  ]);
  for (DaapObject song in database.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    var songTime =
        Duration(milliseconds: song.getAtom(DMAP_CODE_DAAP_SONGTIME));
    stdout.writeln(
        // ignore: lines_longer_than_80_chars, unnecessary_brace_in_string_interps
        '${song.getAtom(DMAP_CODE_DAAP_SONGTRACKNUMBER)}: ${song.getAtom(DMAP_CODE_DMAP_ITEMNAME)} / ${song.getAtom(DMAP_CODE_DAAP_SONGARTIST)} / ${song.getAtom(DMAP_CODE_DAAP_SONGALBUM)} / ${song.getAtom(DMAP_CODE_DAAP_SONGYEAR)} - ${songTime}');
  }
}
