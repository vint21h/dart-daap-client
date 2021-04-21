[//]: # (dart-daap-client)
[//]: # (example/README.md)

# Usage

1. [Initialize it](init.dart)
2. [Connect to the server](connect.dart)
* [Get databases list](get_databases.dart):

  ↓
  ```console
  $ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart get_databases.dart
  1: test
  ```

* [Get database playlists](get_database_playlists.dart):

  ↓
  ```console
  $ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart get_database_playlists.dart
  1: example.com (22)
  2: My Top Rated (0)
  3: Recently Added (0)
  4: Recently Played (0)
  ```

* [Get playlist](get_playlist.dart):

  ↓
  ```console
  $ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart get_playlist.dart
  1: Overture / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:28.000000
  [...]
  22: Finale / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:4:23.000000
  ```

* [Get database](get_database.dart):

  ↓
  ```console
  $ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart get_database.dart
  1: Overture / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:2:28.000000
  [...]
  22: Finale / Daft Punk / Tron: Legacy (Original Motion Picture Soundtrack) / 2010 - 0:4:23.000000
  ```

* [Get song](get_song.dart):

  ↓
  ```console
  $ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart get_song.dart
  $ tree
  .
  ├── main.dart
  ├── pubspec.yaml
  └── Daft Punk
      └── 2010 - Tron: Legacy (Original Motion Picture Soundtrack)
          ├── 1. Overture.mp3
          ├── [...]
          └── 22. Finale.mp3
  ```

* [Get song artwork](get_artwork.dart):

  ```yaml
  # pubspec.yaml

  [...]
  dependencies:
    mime: "^1.0.0"
  [...]
  ```
  ↓
  ```console
  $ pub get
  $ DAAP_HOST=localhost DAAP_PASSWORD=secretpassword dart get_artwork.dart
  $ tree
  .
  ├── main.dart
  ├── pubspec.yaml
  └── Daft Punk
      └── Tron: Legacy (Original Motion Picture Soundtrack).jpg
  ```
