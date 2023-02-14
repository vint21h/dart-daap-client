import "objects.dart";

// DMAP data types.

/// DMAP byte data type.
const int byte = 1; // Int8
/// DMAP unsigned byte data type.
const int unsignedByte = 2; // Uint8
/// DMAP short data type.
const int short = 3; // Int16
/// DMAP unsigned short data type.
const int unsignedShort = 4; // Uint16
/// DMAP integer data type.
const int integer = 5; // Int32
/// DMAP unsigned integer data type.
const int unsignedInteger = 6; // Int32
/// DMAP long data type.
const int long = 7; // Int64
/// DMAP unsigned long data type.
const int unsignedLong = 8; // Uint64
/// DMAP string data type.
const int string = 9; // String
/// DMAP timestamp data type.
const int timestamp = 10; // double
/// DMAP version data type.
const int version = 11; // Uint32
/// DMAP container data type.
const int container = 12; // List<DmapObject>

/// DMAP data types mapping (according to protocol).
const Map<int, String> dmapDataTypes = {
  byte: "b", // Int8
  unsignedByte: "ub", // Uint8
  short: "h", // Int16
  unsignedShort: "uh", // Uint16
  integer: "i", // Int32
  unsignedInteger: "ui", // Uint32
  long: "l", // Int64
  unsignedLong: "ul", // Uint64
  string: "s", // String
  timestamp: "t", // double
  version: "v", // Uint32
  container: "c", // List<DmapObject>
};

/// DMAP data types mapping (human readable).
const Map<int, String> dmapDataTypesNames = {
  byte: "byte", // Int8
  unsignedByte: "unsigned byte", // Uint8
  short: "short", // Int16
  unsignedShort: "unsigned short", // Uint16
  integer: "integer", // Int32
  unsignedInteger: "unsigned integer", // Uint32
  long: "long", // Int64
  unsignedLong: "unsigned long", // Uint64
  string: "string", // String
  timestamp: "timestamp", // double
  version: "version", // Uint32
  container: "container", // List<DmapObject>
};

/// DMAP codes.

/// DMAP code 'com.apple.itunes.req-fplay' type.
///
/// Was caught it in the wild instead of 'aeFP'.
const String dmapCodeComAppleItunesReqFplayUnknown = "????";

/// DMAP code 'daap.browsealbumlisting"' type.
const String dmapCodeDaapBrowseAlbumListing = "abal";

/// DMAP 'daap.browseartistlisting' code.
const String dmapCodeDaapBrowseArtistListing = "abar";

/// DMAP 'daap.browsecomposerlisting' code.
const String dmapCodeDaapBrowseComposerListing = "abcp";

/// DMAP 'daap.browsegenrelisting' code.
const String dmapCodeDaapBrowseGenreListing = "abgn";

/// DMAP 'daap.baseplaylist' code.
const String dmapCodeDaapBasePlaylist = "abpl";

/// DMAP 'daap.databasebrowse' code.
const String dmapCodeDaapDatabaseBrowse = "abro";

/// DMAP 'daap.databasesongs' code.
const String dmapCodeDaapDatabaseSongs = "adbs";

/// DMAP 'com.apple.itunes.adam-ids-array' code.
const String dmapCodeComAppleItunesAdamIdsArray = "aeAD";

/// DMAP 'com.apple.itunes.itms-artistid' code.
const String dmapCodeComAppleItunesItmsArtistId = "aeAI";

/// DMAP 'com.apple.itunes.itms-composerid' code.
const String dmapCodeComAppleItunesItmsComposerId = "aeCI";

/// DMAP 'com.apple.itunes.content-rating' code.
const String dmapCodeComAppleItunesContentRating = "aeCR";

/// DMAP 'com.apple.itunes.drm-platform-id' code.
const String dmapCodeComAppleItunesDrmPlatformId = "aeDP";

/// DMAP 'com.apple.itunes.drm-user-id' code.
const String dmapCodeComAppleItunesDrmUserId = "aeDR";

/// DMAP 'com.apple.itunes.drm-versions' code.
const String dmapCodeComAppleItunesDrmVersions = "aeDV";

/// DMAP 'com.apple.itunes.episode-num-str' code.
const String dmapCodeComAppleItunesEpisodeNumStr = "aeEN";

/// DMAP 'com.apple.itunes.episode-sort' code.
const String dmapCodeComAppleItunesEpisodeSort = "aeES";

/// DMAP 'com.apple.itunes.req-fplay' code.
const String dmapCodeComAppleItunesReqFplay = "aeFP";

/// DMAP 'com.apple.itunes.gapless-enc-dr' code.
const String dmapCodeComAppleItunesGaplessEncDr = "aeGD";

/// DMAP 'com.apple.itunes.gapless-enc-del' code.
const String dmapCodeComAppleItunesGaplessEncDel = "aeGE";

/// DMAP 'com.apple.itunes.gapless-heur' code.
const String dmapCodeComAppleItunesGaplessHeur = "aeGH";

/// DMAP 'com.apple.itunes.itms-genreid' code.
const String dmapCodeComAppleItunesItmsGenreId = "aeGI";

/// DMAP 'com.apple.itunes.gapless-resy' code.
const String dmapCodeComAppleItunesGaplessResy = "aeGR";

/// DMAP 'com.apple.itunes.gapless-dur' code.
const String dmapCodeComAppleItunesGaplessDur = "aeGU";

/// DMAP 'com.apple.itunes.is-hd-video"' code.
const String dmapCodeComAppleItunesIsHdVideo = "aeHD";

/// DMAP 'com.apple.itunes.has-video' code.
const String dmapCodeComAppleItunesHasVideo = "aeHV";

/// DMAP 'com.apple.itunes.drm-key1-id' code.
const String dmapCodeComAppleItunesDrmKey1Id = "aeK1";

/// DMAP 'com.apple.itunes.drm-key2-id' code.
const String dmapCodeComAppleItunesDrmKey2Id = "aeK2";

/// DMAP 'com.apple.itunes.extended-media-kind' code.
const String dmapCodeComAppleItunesExtendedMediaKind = "aeMk";

/// DMAP 'com.apple.itunes.mediakind' code.
const String dmapCodeComAppleItunesMediaKind = "aeMK";

/// DMAP 'com.apple.itunes.non-drm-user-id' code.
const String dmapCodeComAppleItunesNonDrmUserId = "aeND";

/// DMAP 'com.apple.itunes.network-name' code.
const String dmapCodeComAppleItunesNetworkName = "aeNN";

/// DMAP 'com.apple.itunes.norm-volume' code.
const String dmapCodeComAppleItunesNormVolume = "aeNV";

/// DMAP 'com.apple.itunes.is-podcast' code.
const String dmapCodeComAppleItunesIsPodcast = "aePC";

/// DMAP 'com.apple.itunes.itms-playlistid' code.
const String dmapCodeComAppleItunesItmsPlaylistId = "aePI";

/// DMAP 'com.apple.itunes.is-podcast-playlist' code.
const String dmapCodeComAppleItunesIsPodcastPlaylist = "aePP";

/// DMAP 'com.apple.itunes.special-playlist' code.
const String dmapCodeComAppleItunesSpecialPlaylist = "aePS";

/// DMAP 'com.apple.itunes.itms-storefrontid' code.
const String dmapCodeComAppleItunesStoreFrontId = "aeSF";

/// DMAP 'com.apple.itunes.saved-genius' code.
const String dmapCodeComAppleItunesSavedGenius = "aeSG";

/// DMAP 'com.apple.itunes.itms-songid' code.
const String dmapCodeComAppleItunesItmsSongId = "aeSI";

/// DMAP 'com.apple.itunes.series-name' code.
const String dmapCodeComAppleItunesSeriesName = "aeSN";

/// DMAP 'com.apple.itunes.smart-playlist' code.
const String dmapCodeComAppleItunesSmartPlaylist = "aeSP";

/// DMAP 'com.apple.itunes.season-num' code.
const String dmapCodeComAppleItunesSeasonNum = "aeSU";

/// DMAP 'com.apple.itunes.music-sharing-version' code.
const String dmapCodeComAppleItunesMusicSharingVersion = "aeSV";

/// DMAP 'daap.songgrouping' code.
const String dmapCodeDaapSongGrouping = "agrp";

/// DMAP 'daap.databaseplaylists' code.
const String dmapCodeDaapDatabasePlaylists = "aply";

/// DMAP 'daap.playlistrepeatmode' code.
const String dmapCodeDaapPlaylistRepeatMode = "aprm";

/// DMAP 'daap.protocolversion' code.
const String dmapCodeDaapProtocolVersion = "apro";

/// DMAP 'daap.playlistshufflemode' code.
const String dmapCodeDaapPlaylistsShuffleMode = "apsm";

/// DMAP 'daap.playlistsongs' code.
const String dmapCodeDaapPlaylistSongs = "apso";

/// DMAP 'daap.resolveinfo' code.
const String dmapCodeDaapResolveInfo = "arif";

/// DMAP 'daap.resolve' code.
const String dmapCodeDaapResolve = "arsv";

/// DMAP 'daap.songalbumartist' code.
const String dmapCodeDaapSongAlbumArtist = "asaa";

/// DMAP 'daap.songalbumid' code.
const String dmapCodeDaapSongAlbumId = "asai";

/// DMAP 'daap.songalbum' code.
const String dmapCodeDaapSongAlbum = "asal";

/// DMAP 'daap.songartist' code.
const String dmapCodeDaapSongArtist = "asar";

/// DMAP 'daap.bookmarkable' code.
const String dmapCodeDaapBookmarkable = "asbk";

/// DMAP 'daap.songbookmark' code.
const String dmapCodeDaapSongBookmark = "asbo";

/// DMAP 'daap.songbitrate' code.
const String dmapCodeDaapSongBitrate = "asbr";

/// DMAP 'daap.songbeatsperminute' code.
const String dmapCodeDaapSongBeatsPerMinute = "asbt";

/// DMAP 'daap.songcodectype' code.
const String dmapCodeDaapSongCodecType = "ascd";

/// DMAP 'daap.songcomment' code.
const String dmapCodeDaapSongComment = "ascm";

/// DMAP 'daap.songcontentdescription' code.
const String dmapCodeDaapSongContentDescription = "ascn";

/// DMAP 'daap.songcompilation' code.
const String dmapCodeDaapSongCompilation = "asco";

/// DMAP 'daap.songcomposer' code.
const String dmapCodeDaapSongComposer = "ascp";

/// DMAP 'daap.songcontentrating' code.
const String dmapCodeDaapSongContentRating = "ascr";

/// DMAP 'daap.songcodecsubtype' code.
const String dmapCodeDaapSongCodecSubtype = "ascs";

/// DMAP 'daap.songcategory' code.
const String dmapCodeDaapSongCategory = "asct";

/// DMAP 'daap.songdateadded' code.
const String dmapCodeDaapSongDateAdded = "asda";

/// DMAP 'daap.songdisabled' code.
const String dmapCodeDaapSongDisabled = "asdb";

/// DMAP 'daap.songdisccount' code.
const String dmapCodeDaapSongDiscCount = "asdc";

/// DMAP 'daap.songdatakind' code.
const String dmapCodeDaapSongDataKind = "asdk";

/// DMAP 'daap.songdatemodified' code.
const String dmapCodeDaapSongDateModified = "asdm";

/// DMAP 'daap.songdiscnumber' code.
const String dmapCodeDaapSongDiscNumber = "asdn";

/// DMAP 'daap.songdatepurchased' code.
const String dmapCodeDaapSongDatePurchased = "asdp";

/// DMAP 'daap.songdatereleased' code.
const String dmapCodeDaapSongDateReleased = "asdr";

/// DMAP 'daap.songdescription' code.
const String dmapCodeDaapSongDescription = "asdt";

/// DMAP 'daap.songextradata' code.
const String dmapCodeDaapSongExtraData = "ased";

/// DMAP 'daap.songeqpreset' code.
const String dmapCodeDaapSongEqPreset = "aseq";

/// DMAP 'daap.songformat' code.
const String dmapCodeDaapSongFormat = "asfm";

/// DMAP 'daap.songgenre' code.
const String dmapCodeDaapSongGenre = "asgn";

/// DMAP 'daap.songgapless' code.
const String dmapCodeDaapSongGapless = "asgp";

/// DMAP 'daap.songhasbeenplayed' code.
const String dmapCodeDaapSongHasBeenPlayed = "ashp";

/// DMAP 'daap.songkeywords' code.
const String dmapCodeDaapSongKeywords = "asky";

/// DMAP 'daap.songlongcontentdescription' code.
const String dmapCodeDaapSongLongContentDescription = "aslc";

/// DMAP 'daap.songlongsize' code.
const String dmapCodeDaapSongLongSize = "asls";

/// DMAP 'daap.songsonpodcasturl' code.
const String dmapCodeDaapSongPodcastUrl = "aspu";

/// DMAP 'daap.songrelativevolume' code.
const String dmapCodeDaapSongRelativeVolume = "asrv";

/// DMAP 'daap.sortartist' code.
const String dmapCodeDaapSortArtist = "assa";

/// DMAP 'daap.sortcomposer' code.
const String dmapCodeDaapSortComposer = "assc";

/// DMAP 'daap.sortalbumartist' code.
const String dmapCodeDaapSortAlbumArtist = "assl";

/// DMAP 'daap.sortname' code.
const String dmapCodeDaapSortName = "assn";

/// DMAP 'daap.songstoptime' code.
const String dmapCodeDaapSongStopTime = "assp";

/// DMAP 'daap.songsamplerate' code.
const String dmapCodeDaapSongSampleRate = "assr";

/// DMAP 'daap.sortseriesname' code.
const String dmapCodeDaapSongSeriesName = "asss";

/// DMAP 'daap.songstarttime' code.
const String dmapCodeDaapSongStartTime = "asst";

/// DMAP 'daap.sortalbum' code.
const String dmapCodeDaapSongSortAlbum = "assu";

/// DMAP 'daap.songsize' code.
const String dmapCodeDaapSongSize = "assz";

/// DMAP 'daap.songtrackcount' code.
const String dmapCodeDaapSongTrackCount = "astc";

/// DMAP 'daap.songtime' code.
const String dmapCodeDaapSongTime = "astm";

/// DMAP 'daap.songtracknumber' code.
const String dmapCodeDaapSongTrackNumber = "astn";

/// DMAP 'daap.songdataurl' code.
const String dmapCodeDaapSongDataUrl = "asul";

/// DMAP 'daap.songuserrating' code.
const String dmapCodeDaapSongUserRating = "asur";

/// DMAP 'daap.songyear' code.
const String dmapCodeDaapSongYear = "asyr";

/// DMAP 'daap.supportsextradata' code.
const String dmapCodeDaapSupportsExtraData = "ated";

/// DMAP 'daap.serverdatabases' code.
const String dmapCodeDaapServerDatabases = "avdb";

/// DMAP 'com.apple.itunes.jukebox-client-vote' code.
const String dmapCodeComAppleItunesJukeboxClientVote = "ceJC";

/// DMAP 'com.apple.itunes.jukebox-current' code.
const String dmapCodeComAppleItunesJukeboxCurrent = "ceJI";

/// DMAP 'com.apple.itunes.jukebox-vote' code.
const String dmapCodeComAppleItunesJukeboxVote = "ceJV";

/// DMAP 'dmap.haschildcontainers' code.
const String dmapCodeDmapHasChildContainers = "f?ch";

/// DMAP 'dmap.bag' code.
const String dmapCodeDmapBag = "mbcl";

/// DMAP 'dmap.contentcodesresponse' code.
const String dmapCodeDmapContentCodesResponse = "mccr";

/// DMAP 'dmap.contentcodesname' code.
const String dmapCodeDmapContentCodesName = "mcna";

/// DMAP 'dmap.contentcodesnumber' code.
const String dmapCodeDmapContentCodesNumber = "mcnm";

/// DMAP 'dmap.container' code.
const String dmapCodeDmapContainer = "mcon";

/// DMAP 'dmap.containercount' code.
const String dmapCodeDmapContainerCount = "mctc";

/// DMAP 'dmap.containeritemid' code.
const String dmapCodeDmapContainerItemId = "mcti";

/// DMAP 'dmap.contentcodestype' code.
const String dmapCodeDmapContentCodesType = "mcty";

/// DMAP 'dmap.dictionary' code.
const String dmapCodeDmapDictionary = "mdcl";

/// DMAP 'dmap.editcommandssupported' code.
const String dmapCodeDmapEditCommandSupported = "meds";

/// DMAP 'dmap.itemid' code.
const String dmapCodeDmapItemId = "miid";

/// DMAP 'dmap.itemkind' code.
const String dmapCodeDmapItemKind = "mikd";

/// DMAP 'dmap.itemcount' code.
const String dmapCodeDmapItemCount = "mimc";

/// DMAP 'dmap.itemname' code.
const String dmapCodeDmapItemName = "minm";

/// DMAP 'dmap.listing' code.
const String dmapCodeDmapListing = "mlcl";

/// DMAP 'dmap.sessionid' code.
const String dmapCodeDmapSessionId = "mlid";

/// DMAP 'dmap.listingitem' code.
const String dmapCodeDmapListingItem = "mlit";

/// DMAP 'dmap.loginresponse' code.
const String dmapCodeDmapLoginResponse = "mlog";

/// DMAP 'dmap.parentcontainerid' code.
const String dmapCodeDmapParentContainerId = "mpco";

/// DMAP 'dmap.persistentid' code.
const String dmapCodeDmapPersistentId = "mper";

/// DMAP 'dmap.protocolversion' code.
const String dmapCodeDmapProtocolVersion = "mpro";

/// DMAP 'dmap.returnedcount' code.
const String dmapCodeDmapReturnedCount = "mrco";

/// DMAP 'dmap.supportsautologout' code.
const String dmapCodeDmapSupportsAutoLogout = "msal";

/// DMAP 'dmap.authenticationschemes' code.
const String dmapCodeDmapAuthenticationSchemes = "msas";

/// DMAP 'dmap.authenticationmethod' code.
const String dmapCodeDmapAuthenticationMethod = "msau";

/// DMAP 'dmap.supportsbrowse' code.
const String dmapCodeDmapSupportsBrowse = "msbr";

/// DMAP 'dmap.databasescount' code.
const String dmapCodeDmapDatabasesCount = "msdc";

/// DMAP 'dmap.supportsextensions' code.
const String dmapCodeDmapSupportsExtension = "msex";

/// DMAP 'dmap.supportsindex' code.
const String dmapCodeDmapSupportsIndex = "msix";

/// DMAP 'dmap.loginrequired' code.
const String dmapCodeDmapLoginRequired = "mslr";

/// DMAP 'dmap.supportspersistentids' code.
const String dmapCodeDmapSupportsPersistentIds = "mspi";

/// DMAP 'dmap.supportsquery' code.
const String dmapCodeDmapSupportsQuery = "msqy";

/// DMAP 'dmap.supportsresolve' code.
const String dmapCodeDmapSupportsResolve = "msrs";

/// DMAP 'dmap.serverinforesponse' code.
const String dmapCodeDmapServerInfoResponse = "msrv";

/// DMAP 'dmap.utctime' code.
const String dmapCodeDmapUtcTime = "mstc";

/// DMAP 'dmap.timeoutinterval' code.
const String dmapCodeDmapTimeoutInterval = "mstm";

/// DMAP 'dmap.utcoffset' code.
const String dmapCodeDmapUtcOffset = "msto";

/// DMAP 'dmap.statusstring' code.
const String dmapCodeDmapStatusString = "msts";

/// DMAP 'dmap.status' code.
const String dmapCodeDmapStatus = "mstt";

/// DMAP 'dmap.supportsupdate' code.
const String dmapCodeDmapSupportsUpdate = "msup";

/// DMAP 'dmap.specifiedtotalcount' code.
const String dmapCodeDmapSpecifiedTotalCount = "mtco";

/// DMAP 'dmap.deletedidlisting' code.
const String dmapCodeDmapDeletedIdListing = "mudl";

/// DMAP 'dmap.updateresponse' code.
const String dmapCodeDmapUpdateResponse = "mupd";

/// DMAP 'dmap.serverrevision' code.
const String dmapCodeDmapServerRevision = "musr";

/// DMAP 'dmap.updatetype' code.
const String dmapCodeDmapUpdateType = "muty";

/// DMAP 'dpap.protocolversion' code.
const String dmapCodeDpapProtocolVersion = "ppro";

/// DMAP 'dpap.unknown' code.
const String dmapCodeDpapUnknown = "pret";

/// DMAP codes mapping.
final Map<String, DmapCode> dmapCodeTypes = {
  dmapCodeComAppleItunesReqFplayUnknown: DmapCode(
      dmapCodeComAppleItunesReqFplayUnknown,
      "com.apple.itunes.req-fplay",
      byte),
  dmapCodeDaapBrowseAlbumListing: DmapCode(
      dmapCodeDaapBrowseAlbumListing, "daap.browsealbumlisting", container),
  dmapCodeDaapBrowseArtistListing: DmapCode(
      dmapCodeDaapBrowseArtistListing, "daap.browseartistlisting", container),
  dmapCodeDaapBrowseComposerListing: DmapCode(dmapCodeDaapBrowseComposerListing,
      "daap.browsecomposerlisting", container),
  dmapCodeDaapBrowseGenreListing: DmapCode(
      dmapCodeDaapBrowseGenreListing, "daap.browsegenrelisting", container),
  dmapCodeDaapBasePlaylist:
      DmapCode(dmapCodeDaapBasePlaylist, "daap.baseplaylist", byte),
  dmapCodeDaapDatabaseBrowse:
      DmapCode(dmapCodeDaapDatabaseBrowse, "daap.databasebrowse", container),
  dmapCodeDaapDatabaseSongs:
      DmapCode(dmapCodeDaapDatabaseSongs, "daap.databasesongs", container),
  dmapCodeComAppleItunesAdamIdsArray: DmapCode(
      dmapCodeComAppleItunesAdamIdsArray,
      "com.apple.itunes.adam-ids-array",
      container),
  dmapCodeComAppleItunesItmsArtistId: DmapCode(
      dmapCodeComAppleItunesItmsArtistId,
      "com.apple.itunes.itms-artistid",
      integer),
  dmapCodeComAppleItunesItmsComposerId: DmapCode(
      dmapCodeComAppleItunesItmsComposerId,
      "com.apple.itunes.itms-composerid",
      integer),
  dmapCodeComAppleItunesContentRating: DmapCode(
      dmapCodeComAppleItunesContentRating,
      "com.apple.itunes.content-rating",
      string),
  dmapCodeComAppleItunesDrmPlatformId: DmapCode(
      dmapCodeComAppleItunesDrmPlatformId,
      "com.apple.itunes.drm-platform-id",
      integer),
  dmapCodeComAppleItunesDrmUserId: DmapCode(
      dmapCodeComAppleItunesDrmUserId, "com.apple.itunes.drm-user-id", long),
  dmapCodeComAppleItunesDrmVersions: DmapCode(dmapCodeComAppleItunesDrmVersions,
      "com.apple.itunes.drm-versions", integer),
  dmapCodeComAppleItunesEpisodeNumStr: DmapCode(
      dmapCodeComAppleItunesEpisodeNumStr,
      "com.apple.itunes.episode-num-str",
      string),
  dmapCodeComAppleItunesEpisodeSort: DmapCode(dmapCodeComAppleItunesEpisodeSort,
      "com.apple.itunes.episode-sort", integer),
  dmapCodeComAppleItunesReqFplay: DmapCode(
      dmapCodeComAppleItunesReqFplay, "com.apple.itunes.req-fplay", byte),
  dmapCodeComAppleItunesGaplessEncDr: DmapCode(
      dmapCodeComAppleItunesGaplessEncDr,
      "com.apple.itunes.gapless-enc-dr",
      integer),
  dmapCodeComAppleItunesGaplessEncDel: DmapCode(
      dmapCodeComAppleItunesGaplessEncDel,
      "com.apple.itunes.gapless-enc-del",
      integer),
  dmapCodeComAppleItunesGaplessHeur: DmapCode(dmapCodeComAppleItunesGaplessHeur,
      "com.apple.itunes.gapless-heur", integer),
  dmapCodeComAppleItunesItmsGenreId: DmapCode(dmapCodeComAppleItunesItmsGenreId,
      "com.apple.itunes.itms-genreid", integer),
  dmapCodeComAppleItunesGaplessResy: DmapCode(
      dmapCodeComAppleItunesGaplessResy, "com.apple.itunes.gapless-resy", long),
  dmapCodeComAppleItunesGaplessDur: DmapCode(
      dmapCodeComAppleItunesGaplessDur, "com.apple.itunes.gapless-dur", long),
  dmapCodeComAppleItunesIsHdVideo: DmapCode(
      dmapCodeComAppleItunesIsHdVideo, "com.apple.itunes.is-hd-video", byte),
  dmapCodeComAppleItunesHasVideo: DmapCode(
      dmapCodeComAppleItunesHasVideo, "com.apple.itunes.has-video", byte),
  dmapCodeComAppleItunesDrmKey1Id: DmapCode(
      dmapCodeComAppleItunesDrmKey1Id, "com.apple.itunes.drm-key1-id", long),
  dmapCodeComAppleItunesDrmKey2Id: DmapCode(
      dmapCodeComAppleItunesDrmKey2Id, "com.apple.itunes.drm-key2-id", long),
  dmapCodeComAppleItunesExtendedMediaKind: DmapCode(
      dmapCodeComAppleItunesExtendedMediaKind,
      "com.apple.itunes.extended-media-kind",
      integer),
  dmapCodeComAppleItunesMediaKind: DmapCode(
      dmapCodeComAppleItunesMediaKind, "com.apple.itunes.mediakind", byte),
  dmapCodeComAppleItunesNonDrmUserId: DmapCode(
      dmapCodeComAppleItunesNonDrmUserId,
      "com.apple.itunes.non-drm-user-id",
      long),
  dmapCodeComAppleItunesNetworkName: DmapCode(dmapCodeComAppleItunesNetworkName,
      "com.apple.itunes.network-name", string),
  dmapCodeComAppleItunesNormVolume: DmapCode(dmapCodeComAppleItunesNormVolume,
      "com.apple.itunes.norm-volume", integer),
  dmapCodeComAppleItunesIsPodcast: DmapCode(
      dmapCodeComAppleItunesIsPodcast, "com.apple.itunes.is-podcast", byte),
  dmapCodeComAppleItunesItmsPlaylistId: DmapCode(
      dmapCodeComAppleItunesItmsPlaylistId,
      "com.apple.itunes.itms-playlistid",
      integer),
  dmapCodeComAppleItunesIsPodcastPlaylist: DmapCode(
      dmapCodeComAppleItunesIsPodcastPlaylist,
      "com.apple.itunes.is-podcast-playlist",
      byte),
  dmapCodeComAppleItunesSpecialPlaylist: DmapCode(
      dmapCodeComAppleItunesSpecialPlaylist,
      "com.apple.itunes.special-playlist",
      byte),
  dmapCodeComAppleItunesStoreFrontId: DmapCode(
      dmapCodeComAppleItunesStoreFrontId,
      "com.apple.itunes.itms-storefrontid",
      integer),
  dmapCodeComAppleItunesSavedGenius: DmapCode(
      dmapCodeComAppleItunesSavedGenius, "com.apple.itunes.saved-genius", byte),
  dmapCodeComAppleItunesItmsSongId: DmapCode(dmapCodeComAppleItunesItmsSongId,
      "com.apple.itunes.itms-songid", integer),
  dmapCodeComAppleItunesSeriesName: DmapCode(
      dmapCodeComAppleItunesSeriesName, "com.apple.itunes.series-name", string),
  dmapCodeComAppleItunesSmartPlaylist: DmapCode(
      dmapCodeComAppleItunesSmartPlaylist,
      "com.apple.itunes.smart-playlist",
      byte),
  dmapCodeComAppleItunesSeasonNum: DmapCode(
      dmapCodeComAppleItunesSeasonNum, "com.apple.itunes.season-num", integer),
  dmapCodeComAppleItunesMusicSharingVersion: DmapCode(
      dmapCodeComAppleItunesMusicSharingVersion,
      "com.apple.itunes.music-sharing-version",
      integer),
  dmapCodeDaapSongGrouping:
      DmapCode(dmapCodeDaapSongGrouping, "daap.songgrouping", string),
  dmapCodeDaapDatabasePlaylists: DmapCode(
      dmapCodeDaapDatabasePlaylists, "daap.databaseplaylists", container),
  dmapCodeDaapPlaylistRepeatMode:
      DmapCode(dmapCodeDaapPlaylistRepeatMode, "daap.playlistrepeatmode", byte),
  dmapCodeDaapProtocolVersion:
      DmapCode(dmapCodeDaapProtocolVersion, "daap.protocolversion", version),
  dmapCodeDaapPlaylistsShuffleMode: DmapCode(
      dmapCodeDaapPlaylistsShuffleMode, "daap.playlistshufflemode", byte),
  dmapCodeDaapPlaylistSongs:
      DmapCode(dmapCodeDaapPlaylistSongs, "daap.playlistsongs", container),
  dmapCodeDaapResolveInfo:
      DmapCode(dmapCodeDaapResolveInfo, "daap.resolveinfo", container),
  dmapCodeDaapResolve: DmapCode(dmapCodeDaapResolve, "daap.resolve", container),
  dmapCodeDaapSongAlbumArtist:
      DmapCode(dmapCodeDaapSongAlbumArtist, "daap.songalbumartist", string),
  dmapCodeDaapSongAlbumId:
      DmapCode(dmapCodeDaapSongAlbumId, "daap.songalbumid", long),
  dmapCodeDaapSongAlbum:
      DmapCode(dmapCodeDaapSongAlbum, "daap.songalbum", string),
  dmapCodeDaapSongArtist:
      DmapCode(dmapCodeDaapSongArtist, "daap.songartist", string),
  dmapCodeDaapBookmarkable:
      DmapCode(dmapCodeDaapBookmarkable, "daap.bookmarkable", byte),
  dmapCodeDaapSongBookmark:
      DmapCode(dmapCodeDaapSongBookmark, "daap.songbookmark", integer),
  dmapCodeDaapSongBitrate:
      DmapCode(dmapCodeDaapSongBitrate, "daap.songbitrate", short),
  dmapCodeDaapSongBeatsPerMinute: DmapCode(
      dmapCodeDaapSongBeatsPerMinute, "daap.songbeatsperminute", short),
  dmapCodeDaapSongCodecType:
      DmapCode(dmapCodeDaapSongCodecType, "daap.songcodectype", integer),
  dmapCodeDaapSongComment:
      DmapCode(dmapCodeDaapSongComment, "daap.songcomment", string),
  dmapCodeDaapSongContentDescription: DmapCode(
      dmapCodeDaapSongContentDescription,
      "daap.songcontentdescription",
      string),
  dmapCodeDaapSongCompilation:
      DmapCode(dmapCodeDaapSongCompilation, "daap.songcompilation", byte),
  dmapCodeDaapSongComposer:
      DmapCode(dmapCodeDaapSongComposer, "daap.songcomposer", string),
  dmapCodeDaapSongContentRating:
      DmapCode(dmapCodeDaapSongContentRating, "daap.songcontentrating", byte),
  dmapCodeDaapSongCodecSubtype:
      DmapCode(dmapCodeDaapSongCodecSubtype, "daap.songcodecsubtype", integer),
  dmapCodeDaapSongCategory:
      DmapCode(dmapCodeDaapSongCategory, "daap.songcategory", string),
  dmapCodeDaapSongDateAdded:
      DmapCode(dmapCodeDaapSongDateAdded, "daap.songdateadded", timestamp),
  dmapCodeDaapSongDisabled:
      DmapCode(dmapCodeDaapSongDisabled, "daap.songdisabled", byte),
  dmapCodeDaapSongDiscCount:
      DmapCode(dmapCodeDaapSongDiscCount, "daap.songdisccount", short),
  dmapCodeDaapSongDataKind:
      DmapCode(dmapCodeDaapSongDataKind, "daap.songdatakind", byte),
  dmapCodeDaapSongDateModified: DmapCode(
      dmapCodeDaapSongDateModified, "daap.songdatemodified", timestamp),
  dmapCodeDaapSongDiscNumber:
      DmapCode(dmapCodeDaapSongDiscNumber, "daap.songdiscnumber", short),
  dmapCodeDaapSongDatePurchased: DmapCode(
      dmapCodeDaapSongDatePurchased, "daap.songdatepurchased", timestamp),
  dmapCodeDaapSongDateReleased: DmapCode(
      dmapCodeDaapSongDateReleased, "daap.songdatereleased", timestamp),
  dmapCodeDaapSongDescription:
      DmapCode(dmapCodeDaapSongDescription, "daap.songdescription", string),
  dmapCodeDaapSongExtraData:
      DmapCode(dmapCodeDaapSongExtraData, "daap.songextradata", short),
  dmapCodeDaapSongEqPreset:
      DmapCode(dmapCodeDaapSongEqPreset, "daap.songeqpreset", string),
  dmapCodeDaapSongFormat:
      DmapCode(dmapCodeDaapSongFormat, "daap.songformat", string),
  dmapCodeDaapSongGenre:
      DmapCode(dmapCodeDaapSongGenre, "daap.songgenre", string),
  dmapCodeDaapSongGapless:
      DmapCode(dmapCodeDaapSongGapless, "daap.songgapless", byte),
  dmapCodeDaapSongHasBeenPlayed:
      DmapCode(dmapCodeDaapSongHasBeenPlayed, "daap.songhasbeenplayed", byte),
  dmapCodeDaapSongKeywords:
      DmapCode(dmapCodeDaapSongKeywords, "daap.songkeywords", string),
  dmapCodeDaapSongLongContentDescription: DmapCode(
      dmapCodeDaapSongLongContentDescription,
      "daap.songlongcontentdescription",
      string),
  dmapCodeDaapSongLongSize:
      DmapCode(dmapCodeDaapSongLongSize, "daap.songlongsize", string),
  dmapCodeDaapSongPodcastUrl:
      DmapCode(dmapCodeDaapSongPodcastUrl, "daap.songsonpodcasturl", string),
  dmapCodeDaapSongRelativeVolume: DmapCode(
      dmapCodeDaapSongRelativeVolume, "daap.songrelativevolume", unsignedByte),
  dmapCodeDaapSortArtist:
      DmapCode(dmapCodeDaapSortArtist, "daap.sortartist", string),
  dmapCodeDaapSortComposer:
      DmapCode(dmapCodeDaapSortComposer, "daap.sortcomposer", string),
  dmapCodeDaapSortAlbumArtist:
      DmapCode(dmapCodeDaapSortAlbumArtist, "daap.sortalbumartist", string),
  dmapCodeDaapSortName: DmapCode(dmapCodeDaapSortName, "daap.sortname", string),
  dmapCodeDaapSongStopTime:
      DmapCode(dmapCodeDaapSongStopTime, "daap.songstoptime", integer),
  dmapCodeDaapSongSampleRate:
      DmapCode(dmapCodeDaapSongSampleRate, "daap.songsamplerate", integer),
  dmapCodeDaapSongSeriesName:
      DmapCode(dmapCodeDaapSongSeriesName, "daap.sortseriesname", string),
  dmapCodeDaapSongStartTime:
      DmapCode(dmapCodeDaapSongStartTime, "daap.songstarttime", integer),
  dmapCodeDaapSongSortAlbum:
      DmapCode(dmapCodeDaapSongSortAlbum, "daap.sortalbum", string),
  dmapCodeDaapSongSize:
      DmapCode(dmapCodeDaapSongSize, "daap.songsize", integer),
  dmapCodeDaapSongTrackCount:
      DmapCode(dmapCodeDaapSongTrackCount, "daap.songtrackcount", short),
  dmapCodeDaapSongTime:
      DmapCode(dmapCodeDaapSongTime, "daap.songtime", integer),
  dmapCodeDaapSongTrackNumber:
      DmapCode(dmapCodeDaapSongTrackNumber, "daap.songtracknumber", short),
  dmapCodeDaapSongDataUrl:
      DmapCode(dmapCodeDaapSongDataUrl, "daap.songdataurl", string),
  dmapCodeDaapSongUserRating:
      DmapCode(dmapCodeDaapSongUserRating, "daap.songuserrating", byte),
  dmapCodeDaapSongYear: DmapCode(dmapCodeDaapSongYear, "daap.songyear", short),
  dmapCodeDaapSupportsExtraData:
      DmapCode(dmapCodeDaapSupportsExtraData, "daap.supportsextradata", short),
  dmapCodeDaapServerDatabases:
      DmapCode(dmapCodeDaapServerDatabases, "daap.serverdatabases", container),
  dmapCodeComAppleItunesJukeboxClientVote: DmapCode(
      dmapCodeComAppleItunesJukeboxClientVote,
      "com.apple.itunes.jukebox-client-vote",
      unsignedByte),
  dmapCodeComAppleItunesJukeboxCurrent: DmapCode(
      dmapCodeComAppleItunesJukeboxCurrent,
      "com.apple.itunes.jukebox-current",
      integer),
  dmapCodeComAppleItunesJukeboxVote: DmapCode(dmapCodeComAppleItunesJukeboxVote,
      "com.apple.itunes.jukebox-vote", integer),
  dmapCodeDmapHasChildContainers:
      DmapCode(dmapCodeDmapHasChildContainers, "dmap.haschildcontainers", byte),
  dmapCodeDmapBag: DmapCode(dmapCodeDmapBag, "dmap.bag", container),
  dmapCodeDmapContentCodesResponse: DmapCode(
      dmapCodeDmapContentCodesResponse, "dmap.contentcodesresponse", container),
  dmapCodeDmapContentCodesName:
      DmapCode(dmapCodeDmapContentCodesName, "dmap.contentcodesname", string),
  dmapCodeDmapContentCodesNumber: DmapCode(
      dmapCodeDmapContentCodesNumber, "dmap.contentcodesnumber", integer),
  dmapCodeDmapContainer:
      DmapCode(dmapCodeDmapContainer, "dmap.container", container),
  dmapCodeDmapContainerCount:
      DmapCode(dmapCodeDmapContainerCount, "dmap.containercount", integer),
  dmapCodeDmapContainerItemId:
      DmapCode(dmapCodeDmapContainerItemId, "dmap.containeritemid", integer),
  dmapCodeDmapContentCodesType:
      DmapCode(dmapCodeDmapContentCodesType, "dmap.contentcodestype", short),
  dmapCodeDmapDictionary:
      DmapCode(dmapCodeDmapDictionary, "dmap.dictionary", container),
  dmapCodeDmapEditCommandSupported: DmapCode(
      dmapCodeDmapEditCommandSupported, "dmap.editcommandssupported", long),
  dmapCodeDmapItemId: DmapCode(dmapCodeDmapItemId, "dmap.itemid", integer),
  dmapCodeDmapItemKind: DmapCode(dmapCodeDmapItemKind, "dmap.itemkind", byte),
  dmapCodeDmapItemCount:
      DmapCode(dmapCodeDmapItemCount, "dmap.itemcount", integer),
  dmapCodeDmapItemName: DmapCode(dmapCodeDmapItemName, "dmap.itemname", string),
  dmapCodeDmapListing: DmapCode(dmapCodeDmapListing, "dmap.listing", container),
  dmapCodeDmapSessionId:
      DmapCode(dmapCodeDmapSessionId, "dmap.sessionid", integer),
  dmapCodeDmapListingItem:
      DmapCode(dmapCodeDmapListingItem, "dmap.listingitem", container),
  dmapCodeDmapLoginResponse:
      DmapCode(dmapCodeDmapLoginResponse, "dmap.loginresponse", container),
  dmapCodeDmapParentContainerId: DmapCode(
      dmapCodeDmapParentContainerId, "dmap.parentcontainerid", integer),
  dmapCodeDmapPersistentId:
      DmapCode(dmapCodeDmapPersistentId, "dmap.persistentid", long),
  dmapCodeDmapProtocolVersion:
      DmapCode(dmapCodeDmapProtocolVersion, "dmap.protocolversion", version),
  dmapCodeDmapReturnedCount:
      DmapCode(dmapCodeDmapReturnedCount, "dmap.returnedcount", integer),
  dmapCodeDmapSupportsAutoLogout:
      DmapCode(dmapCodeDmapSupportsAutoLogout, "dmap.supportsautologout", byte),
  dmapCodeDmapAuthenticationSchemes: DmapCode(
      dmapCodeDmapAuthenticationSchemes, "dmap.authenticationschemes", integer),
  dmapCodeDmapAuthenticationMethod: DmapCode(
      dmapCodeDmapAuthenticationMethod, "dmap.authenticationmethod", byte),
  dmapCodeDmapSupportsBrowse:
      DmapCode(dmapCodeDmapSupportsBrowse, "dmap.supportsbrowse", byte),
  dmapCodeDmapDatabasesCount:
      DmapCode(dmapCodeDmapDatabasesCount, "dmap.databasescount", integer),
  dmapCodeDmapSupportsExtension:
      DmapCode(dmapCodeDmapSupportsExtension, "dmap.supportsextensions", byte),
  dmapCodeDmapSupportsIndex:
      DmapCode(dmapCodeDmapSupportsIndex, "dmap.supportsindex", byte),
  dmapCodeDmapLoginRequired:
      DmapCode(dmapCodeDmapLoginRequired, "dmap.loginrequired", byte),
  dmapCodeDmapSupportsPersistentIds: DmapCode(
      dmapCodeDmapSupportsPersistentIds, "dmap.supportspersistentids", byte),
  dmapCodeDmapSupportsQuery:
      DmapCode(dmapCodeDmapSupportsQuery, "dmap.supportsquery", byte),
  dmapCodeDmapSupportsResolve:
      DmapCode(dmapCodeDmapSupportsResolve, "dmap.supportsresolve", byte),
  dmapCodeDmapServerInfoResponse: DmapCode(
      dmapCodeDmapServerInfoResponse, "dmap.serverinforesponse", container),
  dmapCodeDmapUtcTime: DmapCode(dmapCodeDmapUtcTime, "dmap.utctime", timestamp),
  dmapCodeDmapTimeoutInterval:
      DmapCode(dmapCodeDmapTimeoutInterval, "dmap.timeoutinterval", integer),
  dmapCodeDmapUtcOffset:
      DmapCode(dmapCodeDmapUtcOffset, "dmap.utcoffset", unsignedInteger),
  dmapCodeDmapStatusString:
      DmapCode(dmapCodeDmapStatusString, "dmap.statusstring", string),
  dmapCodeDmapStatus: DmapCode(dmapCodeDmapStatus, "dmap.status", integer),
  dmapCodeDmapSupportsUpdate:
      DmapCode(dmapCodeDmapSupportsUpdate, "dmap.supportsupdate", byte),
  dmapCodeDmapSpecifiedTotalCount: DmapCode(
      dmapCodeDmapSpecifiedTotalCount, "dmap.specifiedtotalcount", integer),
  dmapCodeDmapDeletedIdListing: DmapCode(
      dmapCodeDmapDeletedIdListing, "dmap.deletedidlisting", container),
  dmapCodeDmapUpdateResponse:
      DmapCode(dmapCodeDmapUpdateResponse, "dmap.updateresponse", container),
  dmapCodeDmapServerRevision:
      DmapCode(dmapCodeDmapServerRevision, "dmap.serverrevision", integer),
  dmapCodeDmapUpdateType:
      DmapCode(dmapCodeDmapUpdateType, "dmap.updatetype", byte),
  dmapCodeDpapProtocolVersion:
      DmapCode(dmapCodeDpapProtocolVersion, "dpap.protocolversion", integer),
  dmapCodeDpapUnknown: DmapCode(dmapCodeDpapUnknown, "dpap.unknown", container),
};

/// HTTP request headers payload.
final Map<String, String> requestHeaders = {
  "Client-DAAP-Version": "3.0",
  "Client-DAAP-Access-Index": "2",
  "User-Agent": "daapc/0.3.6 (https://github.com/vint21h/dart-daap-client/)",
  "Accept": "application/x-dmap-tagged",
};

/// URLs.

/// Content odes URL.
const String contentCodesUrlPath = "content-codes";

/// Databases URL.
const String databasesUrlPath = "databases";

/// Database URL.
const String databaseUrlPath = "databases/{databaseId}/items";

/// Login URL.
const String loginUrlPath = "login";

/// Playlists URL.
const String playlistsUrlPath = "databases/{databaseId}/containers";

/// Playlist URL.
const String playlistUrlPath =
    "databases/{databaseId}/containers/{playlistId}/items";

/// Server info URL.
const String serverInfoUrlPath = "server-info";

/// Update URL.
const String updateUrlPath = "update";

/// Song URL.
const String songUrlPath = "databases/{databaseId}/items/{songId}.{songFormat}";

/// Song artwork URL.
const String songArtworkUrlPath =
    "databases/{databaseId}/items/{songId}/extra_data/artwork";

// Queries meta's defaults.

/// Default database query meta codes.
const List<String> databaseQueryDefaultMetaCodes = [
  dmapCodeComAppleItunesNormVolume,
  dmapCodeDaapSongAlbumArtist,
  dmapCodeDaapSongArtist,
  dmapCodeDaapSongBitrate,
  dmapCodeDaapSongBeatsPerMinute,
  dmapCodeDaapSongComment,
  dmapCodeDaapSongCompilation,
  dmapCodeDaapSongComposer,
  dmapCodeDaapSongDateAdded,
  dmapCodeDaapSongDisabled,
  dmapCodeDaapSongDiscCount,
  dmapCodeDaapSongDataKind,
  dmapCodeDaapSongDateModified,
  dmapCodeDaapSongDiscNumber,
  dmapCodeDaapSongDescription,
  dmapCodeDaapSongEqPreset,
  dmapCodeDaapSongFormat,
  dmapCodeDaapSongGenre,
  dmapCodeDaapSongRelativeVolume,
  dmapCodeDaapSongStopTime,
  dmapCodeDaapSongSampleRate,
  dmapCodeDaapSongStartTime,
  dmapCodeDaapSongSize,
  dmapCodeDaapSongTrackCount,
  dmapCodeDaapSongTime,
  dmapCodeDaapSongTrackNumber,
  dmapCodeDaapSongDataUrl,
  dmapCodeDaapSongUserRating,
  dmapCodeDaapSongYear,
  dmapCodeDmapItemId,
  dmapCodeDmapItemKind,
  dmapCodeDmapItemName,
  dmapCodeDmapPersistentId,
  dmapCodeDaapSongAlbum,
];

/// Default playlists query meta codes.
const List<String> playlistsQueryDefaultMetaCodes = [
  dmapCodeDaapBasePlaylist,
  dmapCodeComAppleItunesIsPodcastPlaylist,
  dmapCodeComAppleItunesSpecialPlaylist,
  dmapCodeComAppleItunesSavedGenius,
  dmapCodeComAppleItunesSmartPlaylist,
  dmapCodeDmapHasChildContainers,
  dmapCodeDmapItemId,
  dmapCodeDmapItemCount,
  dmapCodeDmapItemName,
  dmapCodeDmapListingItem,
  dmapCodeDmapParentContainerId,
  dmapCodeDmapPersistentId,
];

/// Default playlist query meta codes.
const List<String> playlistQueryDefaultMetaCodes = [
  dmapCodeDaapSongAlbumArtist,
  dmapCodeDaapSongArtist,
  dmapCodeDaapSongFormat,
  dmapCodeDaapSongGenre,
  dmapCodeDaapSongSize,
  dmapCodeDaapSongTime,
  dmapCodeDaapSongTrackNumber,
  dmapCodeDaapSongYear,
  dmapCodeDmapContainerItemId,
  dmapCodeDmapItemId,
  dmapCodeDmapItemKind,
  dmapCodeDmapItemName,
  dmapCodeDaapSongAlbum,
];
