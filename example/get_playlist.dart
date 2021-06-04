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
    dmapCodeDaapSongTrackNumber,
    dmapCodeDmapItemName,
    dmapCodeDaapSongArtist,
    dmapCodeDaapSongAlbum,
    dmapCodeDaapSongYear,
    dmapCodeDaapSongTime,
  ]);
  for (DaapObject song in playlist.getAtom(dmapCodeDmapListing).value) {
    var songTime = Duration(milliseconds: song.getAtom(dmapCodeDaapSongTime));
    stdout.writeln(
        // ignore: lines_longer_than_80_chars
        '${song.getAtom(dmapCodeDaapSongTrackNumber)}: ${song.getAtom(dmapCodeDmapItemName)} / ${song.getAtom(dmapCodeDaapSongArtist)} / ${song.getAtom(dmapCodeDaapSongAlbum)} / ${song.getAtom(dmapCodeDaapSongYear)} - $songTime');
  }
}
