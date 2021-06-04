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
    dmapCodeDaapSongTrackNumber,
    dmapCodeDmapItemName,
    dmapCodeDaapSongArtist,
    dmapCodeDaapSongAlbum,
    dmapCodeDaapSongYear,
    dmapCodeDaapSongTime,
  ]);
  for (DaapObject song in database.getAtom(dmapCodeDmapListing).value) {
    var songTime = Duration(milliseconds: song.getAtom(dmapCodeDaapSongTime));
    stdout.writeln(
        // ignore: lines_longer_than_80_chars, unnecessary_brace_in_string_interps
        '${song.getAtom(dmapCodeDaapSongTrackNumber)}: ${song.getAtom(dmapCodeDmapItemName)} / ${song.getAtom(dmapCodeDaapSongArtist)} / ${song.getAtom(dmapCodeDaapSongAlbum)} / ${song.getAtom(dmapCodeDaapSongYear)} - ${songTime}');
  }
}
