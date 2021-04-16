// dart-daap-client
// example/get_playlist.dart

import "dart:io" show Platform, stdout;

import "package:daapc/daapc.dart";

/// Get playlist songs from the server.
///
/// [DaapClient.getPlaylist] method [metaCodes] param used to get
/// only necessary songs attributes and reduce memory usage.
/// By default equals to [playlistQueryDefaultMetaCodes].
void main() async {
  var envVars = Platform.environment;
  var client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  var playlist = await client.getPlaylist(1, 1, metaCodes: [
    DMAP_CODE_DAAP_SONGTRACKNUMBER,
    DMAP_CODE_DMAP_ITEMNAME,
    DMAP_CODE_DAAP_SONGARTIST,
    DMAP_CODE_DAAP_SONGALBUM,
    DMAP_CODE_DAAP_SONGYEAR,
    DMAP_CODE_DAAP_SONGTIME,
  ]);
  for (DaapObject song in playlist.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    var songTime =
        Duration(milliseconds: song.getAtom(DMAP_CODE_DAAP_SONGTIME));
    stdout.writeln(
        // ignore: lines_longer_than_80_chars
        '${song.getAtom(DMAP_CODE_DAAP_SONGTRACKNUMBER)}: ${song.getAtom(DMAP_CODE_DMAP_ITEMNAME)} / ${song.getAtom(DMAP_CODE_DAAP_SONGARTIST)} / ${song.getAtom(DMAP_CODE_DAAP_SONGALBUM)} / ${song.getAtom(DMAP_CODE_DAAP_SONGYEAR)} - $songTime');
  }
}
