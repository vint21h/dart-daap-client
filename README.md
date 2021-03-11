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
```text
1: test (0)
2: My Top Rated (0)
3: Recently Added (0)
4: Recently Played (0)
```


## Licensing
dart-daap-client uses the MIT license. Please check the MIT-LICENSE file for more details.

## Contacts
**Project Website**: https://github.com/vint21h/dart-daap-client/

**Author**: Alexei Andrushievich <vint21h@vint21h.pp.ua>

For complete authors list see AUTHORS file.
