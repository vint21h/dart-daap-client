[//]: # (dart-daap-client)
[//]: # (README.md)


# dart-daap-client is a Dart DAAP (Digital Audio Access Protocol) client library

## Installation

* Depend on it:
```yaml
# pubspec.yaml

dependencies:
  daapc: "0.1.0"
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
2: The Grid (featuring Jeff Bridges) / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:1:37.000000
3: The Son of Flynn / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:1:35.000000
4: Recognizer / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:38.000000
5: Armory / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:03.000000
6: Arena / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:1:33.000000
7: Rinzler / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:18.000000
8: The Game Has Changed / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:3:25.000000
9: Outlands / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:42.000000
10: Adagio for Tron / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:4:11.000000
11: Nocturne / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:1:42.000000
12: End of Line / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:36.000000
13: Derezzed / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:1:44.000000
14: Fall / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:1:23.000000
15: Solar Saile / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:42.000000
16: Rectifier / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:14.000000
17: Disc Wars / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:4:11.000000
18: C.L.U. / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:4:39.000000
19: Arrival / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:00.000000
20: Flynn Lives / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:3:22.000000
21: Tron Legacy (End Titles) / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:3:18.000000
22: Finale / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:4:23.000000
```

## Licensing
dart-daap-client uses the MIT license. Please check the MIT-LICENSE file for more details.

## Contacts
**Project Website**: https://github.com/vint21h/dart-daap-client/

**Author**: Alexei Andrushievich <vint21h@vint21h.pp.ua>

For complete authors list see AUTHORS file.
