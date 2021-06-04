// dart-daap-client
// example/get_artwork.dart

import "dart:io" show Platform, File;

import "package:daapc/daapc.dart";
import "package:mime/mime.dart";

/// Recursively download playlist songs artworks with creating
/// "{artistName}" directories structure
/// and name songs artwork files as "{albumName}" with corresponding MIME type
/// extension.
void main() async {
  var envVars = Platform.environment;
  var client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  var playlist = await client.getPlaylist(1, 1, metaCodes: [
    dmapCodeDaapSongArtist,
    dmapCodeDaapSongAlbum,
    dmapCodeDmapItemId,
  ]);
  for (DaapObject song in playlist.getAtom(dmapCodeDmapListing).value) {
    // bad idea to get artwork for every song in the playlist, but
    // it is only example
    var path =
        // ignore: lines_longer_than_80_chars
        "${song.getAtom(dmapCodeDaapSongArtist)}/${song.getAtom(dmapCodeDaapSongAlbum)}";
    File(path).create(recursive: true).then((file) async {
      file.writeAsBytes(
          await client.getSongArtwork(1, song.getAtom(dmapCodeDmapItemId)));
      // bad idea to rename file after creation, but it is only example
      file.rename(
          "$path.${extensionFromMime(lookupMimeType(path).toString())}");
    });
  }
}
