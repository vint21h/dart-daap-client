[//]: # (dart-daap-client)
[//]: # (README.md)


# dart-daap-client is a Dart DAAP (Digital Audio Access Protocol) client library

## Installation

* Depend on it:
```yaml
# pubspec.yaml

[...]
dependencies:
  daapc: "0.1.0"
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
/// and supply to it server host and password if it is necessary.
void main() async {
  Map<String, String> envVars = Platform.environment;
  DaapClient client =
      new DaapClient(envVars["DAAP_HOST"], password: envVars["DAAP_PASSWORD"]);
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
  Map<String, String> envVars = Platform.environment;
  DaapClient client =
      new DaapClient(envVars["DAAP_HOST"], password: envVars["DAAP_PASSWORD"]);
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
  Map<String, String> envVars = Platform.environment;
  DaapClient client =
      new DaapClient(envVars["DAAP_HOST"], password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  dynamic databases = await client.getDatabases();
  for (var db in databases.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    stdout.writeln(
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
  Map<String, String> envVars = Platform.environment;
  DaapClient client =
      new DaapClient(envVars["DAAP_HOST"], password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  dynamic playlists = await client.getPlaylists(1);
  for (var playlist in playlists.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    stdout.writeln(
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

void main() async {
  Map<String, String> envVars = Platform.environment;
  DaapClient client =
      new DaapClient(envVars["DAAP_HOST"], password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  dynamic playlist = await client.getPlaylist(1, 1, metaCodes: [
    DMAP_CODE_DAAP_SONGTRACKNUMBER,
    DMAP_CODE_DMAP_ITEMNAME,
    DMAP_CODE_DAAP_SONGARTIST,
    DMAP_CODE_DAAP_SONGALBUM,
    DMAP_CODE_DAAP_SONGYEAR
  ]);
  for (var song in playlist.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    Duration songTime =
        Duration(milliseconds: song.getAtom(DMAP_CODE_DAAP_SONGTIME));
    stdout.writeln(
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

* Get Database:
```dart
// main.dart

import "dart:io" show Platform, stdout;

import "package:daapc/daapc.dart";

void main() async {
  Map<String, String> envVars = Platform.environment;
  DaapClient client =
      new DaapClient(envVars["DAAP_HOST"], password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  dynamic playlist = await client.getDatabase(1, metaCodes: [
    DMAP_CODE_DAAP_SONGTRACKNUMBER,
    DMAP_CODE_DMAP_ITEMNAME,
    DMAP_CODE_DAAP_SONGARTIST,
    DMAP_CODE_DAAP_SONGALBUM,
    DMAP_CODE_DAAP_SONGYEAR
  ]);
  for (var song in playlist.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    Duration songTime =
        Duration(milliseconds: song.getAtom(DMAP_CODE_DAAP_SONGTIME));
    stdout.writeln(
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

## Licensing
dart-daap-client uses the MIT license. Please check the MIT-LICENSE file for more details.

## Contacts
**Project Website**: https://github.com/vint21h/dart-daap-client/

**Author**: Alexei Andrushievich <vint21h@vint21h.pp.ua>

For complete authors list see AUTHORS file.
