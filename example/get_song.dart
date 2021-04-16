// dart-daap-client
// example/get_song.dart

import "dart:io" show Platform, File;

import "package:daapc/daapc.dart";

/// Recursively download playlist songs with creating
/// "{artistName}/{albumYear} - {albumName}" formatted
/// directories structure and name songs files formatted as
/// "{songNumber}. {songName}.{songFormat}".
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
    DMAP_CODE_DMAP_ITEMID,
    DMAP_CODE_DAAP_SONGFORMAT,
  ]);
  for (DaapObject song in playlist.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    var path =
        // ignore: lines_longer_than_80_chars
        "${song.getAtom(DMAP_CODE_DAAP_SONGARTIST)}/${song.getAtom(DMAP_CODE_DAAP_SONGYEAR)} - ${song.getAtom(DMAP_CODE_DAAP_SONGALBUM)}/${song.getAtom(DMAP_CODE_DAAP_SONGTRACKNUMBER)}. ${song.getAtom(DMAP_CODE_DMAP_ITEMNAME)}.${song.getAtom(DMAP_CODE_DAAP_SONGFORMAT)}";
    File(path).create(recursive: true).then((file) async {
      file.writeAsBytes(await client.getSong(
          1,
          song.getAtom(DMAP_CODE_DMAP_ITEMID),
          song.getAtom(DMAP_CODE_DAAP_SONGFORMAT)));
    });
  }
}
