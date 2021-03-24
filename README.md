[//]: # (dart-daap-client)
[//]: # (README.md)

# A dart-daap-client documentation

*dart-daap-client is a Dart [DAAP (Digital Audio Access Protocol)](https://en.wikipedia.org/wiki/DAAP) client library*

[![GitHub](https://github.com/vint21h/dart-daap-client/workflows/build/badge.svg)](https://github.com/vint21h/dart-daap-client/actions/)
[![Coveralls](https://coveralls.io/repos/github/vint21h/dart-daap-client/badge.svg?branch=master)](https://coveralls.io/github/vint21h/dart-daap-client?branch=master)
[![Requires](https://requires.io/github/vint21h/dart-daap-client/requirements.svg?branch=master)](https://requires.io/github/vint21h/dart-daap-client/requirements/?branch=master)
[![Version](https://img.shields.io/pub/v/daapc.svg)](https://pub.dartlang.org/packages/daapc/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT/)

Contents
* [Installation](#installation)
* [Usage](#usage)
* [Acknowledgments](#acknowledgments)
* [Licensing](#licensing)
* [Contacts](#contacts)

## Installation

* Depend on it:
```yaml
# pubspec.yaml

[...]
dependencies:
  daapc: "0.0.0"
[...]
```
* Install it:
```sh
$ pub get
```

## Usage

1. Initialize it:
```dart
// main.dart

import "dart:io" show Platform;

import "package:daapc/daapc.dart";

/// Just create DAAP client class instance
/// and provide server host and password if it is necessary.
void main() async {
  var envVars = Platform.environment;
  DaapClient client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
}
```

2. Connect to server:
```dart
// main.dart

import "dart:io" show Platform;

import "package:daapc/daapc.dart";

/// Connect to server:
/// 1. Get server info
/// 2. Get server content codes data
/// 3. Login to server
/// and saves all server responses to future use.
void main() async {
  var envVars = Platform.environment;
  var client =
      DaapClient(envVars["DAAP_HOST"]!, password: envVars["DAAP_PASSWORD"]);
  await client.connect();
}
```

* Get databases list:
```dart
// main.dart

import "dart:io" show Platform, stdout;

import "package:daapc/daapc.dart";

/// Get databases list from the server.
///
/// Usually it will be only one per server and this name
/// depends on server protocol implementation
/// (for example "Rhythmbox" "DAAP Music Sharing" plugin
/// uses hostname as default if it not configured),
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
```
↓
```sh
$ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart main.dart
```
=
```text
1: test
```

* Get database playlists:
```dart
// main.dart

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
```
↓
```sh
$ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart main.dart
```
=
```text
1: test (22)
2: My Top Rated (0)
3: Recently Added (0)
4: Recently Played (0)
```

* Get playlist:
```dart
// main.dart

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
```
↓
```sh
$ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart main.dart
```
=
```text
1: Overture / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:28.000000
[...]
22: Finale / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:4:23.000000
```

* Get database:
```dart
// main.dart

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
        // ignore: lines_longer_than_80_chars
        '${song.getAtom(DMAP_CODE_DAAP_SONGTRACKNUMBER)}: ${song.getAtom(DMAP_CODE_DMAP_ITEMNAME)} / ${song.getAtom(DMAP_CODE_DAAP_SONGARTIST)} / ${song.getAtom(DMAP_CODE_DAAP_SONGALBUM)} / ${song.getAtom(DMAP_CODE_DAAP_SONGYEAR)} - ${songTime}');
  }
}
```
↓
```sh
$ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart main.dart
```
=
```text
1: Overture / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:28.000000
[...]
22: Finale / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:4:23.000000
```

* Get song:
```dart
// main.dart

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
```
↓
```sh
$ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart main.dart
$ tree
```
=
```text
.
├── main.dart
├── pubspec.yaml
└── Daft Punk
    └── 2010 - Tron: Legacy (Original Motion Picture Soundtrack)
        ├── 1. Overture.mp3
        ├── [...]
        └── 22. Finale.mp3
```

* Get song artwork
```yaml
# pubspec.yaml

[...]
dependencies:
  mime: "^1.0.0"
[...]
```
↓
```dart
// main.dart

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
    DMAP_CODE_DAAP_SONGARTIST,
    DMAP_CODE_DAAP_SONGALBUM,
    DMAP_CODE_DMAP_ITEMID,
  ]);
  for (DaapObject song in playlist.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    // bad idea to get artwork for every song in the playlist, but
    // it is only example
    var path =
        // ignore: lines_longer_than_80_chars
        "${song.getAtom(DMAP_CODE_DAAP_SONGARTIST)}/${song.getAtom(DMAP_CODE_DAAP_SONGALBUM)}";
    File(path).create(recursive: true).then((file) async {
      file.writeAsBytes(
          await client.getSongArtwork(1, song.getAtom(DMAP_CODE_DMAP_ITEMID)));
      // bad idea to rename file after creation, but it is only example
      file.rename(
          "$path.${extensionFromMime(lookupMimeType(path).toString())}");
    });
  }
}
```
↓
```sh
$ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart main.dart
$ tree
```
=
```text
.
├── main.dart
├── pubspec.yaml
└── Daft Punk
    └── Tron: Legacy (Original Motion Picture Soundtrack).jpg
```

## Acknowledgments
* [Digital Audio Access Protocol (DAAP) Protocol documentation v0.2](http://tapjam.net/daap/)
* [Digital Audio Access Protocol (DAAP) Protocol documentation Version 0.3](https://github.com/bjoernricks/daap-protocol/)
* [DAAP client library implemented in Python](https://github.com/tominsam/PythonDaap/)
* [spydaap: a simple DAAP server for python](https://github.com/egh/spydaap/)
* [nodejs DAAP parser](https://github.com/roblan/daap-parser/)
* [Linux/FreeBSD DAAP (iTunes) and MPD media server with support for AirPlay devices (multiroom), Apple Remote (and compatibles), Chromecast, Spotify and internet radio](https://github.com/ejurgensen/forked-daapd/)
* [A C/C++ library to share digital audio between computers on a network, reverse engineered from and compatible with Apple's iTunes 4.0 implementation](https://sourceforge.net/projects/daap/)

## Licensing
dart-daap-client uses the MIT license. Please check the LICENSE file for more details.

## Contacts
**Project Website**: https://github.com/vint21h/dart-daap-client/

**Author**: Alexei Andrushievich <vint21h@vint21h.pp.ua>

For complete authors list see AUTHORS file.
