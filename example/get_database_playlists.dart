// dart-daap-client
// get_database_playlist.dart

import "dart:io" show Platform, stdout;

import "package:daapc/daapc.dart";

/// Get database playlists from the server.
///
/// If there no playlists in the database it will return only one
/// which contains all songs from the database.
/// This name depends on server protocol implementation
/// (for example "Rhythmbox" "DAAP Music Sharing"
/// plugin uses database name (host name) as default).
void main() async {
  var envVars = Platform.environment;
  var client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  var playlists = await client.getPlaylists(1);
  for (DaapObject playlist in playlists.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    stdout.writeln(
        // ignore: lines_longer_than_80_chars
        '${playlist.getAtom(DMAP_CODE_DMAP_ITEMID)}: ${playlist.getAtom(DMAP_CODE_DMAP_ITEMNAME)} (${playlist.getAtom(DMAP_CODE_DMAP_ITEMCOUNT)})');
  }
}
