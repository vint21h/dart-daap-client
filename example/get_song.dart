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
    dmapCodeDaapSongTrackNumber,
    dmapCodeDmapItemName,
    dmapCodeDaapSongArtist,
    dmapCodeDaapSongAlbum,
    dmapCodeDaapSongYear,
    dmapCodeDmapItemId,
    dmapCodeDaapSongFormat,
  ]);
  var songs = playlist.getAtom(dmapCodeDmapListing);
  if (songs != null) {
    for (DaapObject song in playlist.getAtom(dmapCodeDmapListing).value) {
      var path =
          // ignore: lines_longer_than_80_chars
          "${song.getAtom(dmapCodeDaapSongArtist)}/${song.getAtom(dmapCodeDaapSongYear)} - ${song.getAtom(dmapCodeDaapSongAlbum)}/${song.getAtom(dmapCodeDaapSongTrackNumber)}. ${song.getAtom(dmapCodeDmapItemName)}.${song.getAtom(dmapCodeDaapSongFormat)}";
      File(path).create(recursive: true).then((file) async {
        file.writeAsBytes(await client.getSong(
            1,
            song.getAtom(dmapCodeDmapItemId),
            song.getAtom(dmapCodeDaapSongFormat)));
      });
    }
  }
}
