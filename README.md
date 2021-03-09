[//]: # (dart-daap-client)
[//]: # (README.md)


# dart-daap-client is a Dart DAAP (Digital Audio Access Protocol) client library

## Installation

* Depend on it:
```yaml
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
import "dart:io" show Platform;

import "package:daapc/daapc.dart";

void main() async {
  Map<String, String> envVars = Platform.environment;
  DaapClient client =
      new DaapClient(envVars["DAAP_HOST"], password: envVars["DAAP_PASSWORD"]);
  await client.connect();
  for (var db in dbs.getAtom(DMAP_CODE_DMAP_LISTING).value) {
    print('${db.getAtom(DMAP_CODE_DMAP_ITEMID)}: ${db.getAtom(DMAP_CODE_DMAP_ITEMNAME)}');
  }
}
```
```text
1: test
```


## Licensing
dart-daap-client uses the MIT license. Please check the MIT-LICENSE file for more details.

## Contacts
**Project Website**: https://github.com/vint21h/dart-daap-client/

**Author**: Alexei Andrushievich <vint21h@vint21h.pp.ua>

For complete authors list see AUTHORS file.
