// dart-daap-client
// lib/src/constants.dart

import "objects.dart";

/// DMAP data types.

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
///
/// Yes, they named used next convention:
/// has "DMAP_CODE_" prefix,
/// than following code name with namespace where parts of name space delimited
/// by "_" and all that parts is in uppercase.

/// DMAP code 'com.apple.itunes.req-fplay' type.
const String
    DMAP_CODE_COM_APPLE_ITUNES_REQ_FPLAY_UNKNOWN = // ignore: constant_identifier_names
    "????";

/// DMAP code 'daap.browsealbumlisting"' type.
const String
    DMAP_CODE_DAAP_BROWSEALBUMLISTING = // ignore: constant_identifier_names
    "abal";

/// DMAP 'daap.browseartistlisting' code.
const String
    DMAP_CODE_DAAP_BROWSEARTISTLISTING = // ignore: constant_identifier_names
    "abar";

/// DMAP 'daap.browsecomposerlisting' code.
const String
    DMAP_CODE_DAAP_BROWSECOMPOSERLISTING = // ignore: constant_identifier_names
    "abcp";

/// DMAP 'daap.browsegenrelisting' code.
const String
    DMAP_CODE_DAAP_BROWSEGENRELISTING = // ignore: constant_identifier_names
    "abgn";

/// DMAP 'daap.baseplaylist' code.
const String DMAP_CODE_DAAP_BASEPLAYLIST = // ignore: constant_identifier_names
    "abpl";

/// DMAP 'daap.databasebrowse' code.
const String
    DMAP_CODE_DAAP_DATABASEBROWSE = // ignore: constant_identifier_names
    "abro";

/// DMAP 'daap.databasesongs' code.
const String DMAP_CODE_DAAP_DATABASESONGS = // ignore: constant_identifier_names
    "adbs";

/// DMAP 'com.apple.itunes.adam-ids-array' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_ADAM_IDS_ARRAY = // ignore: constant_identifier_names
    "aeAD";

/// DMAP 'com.apple.itunes.itms-artistid' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_ITMS_ARTISTID = // ignore: constant_identifier_names
    "aeAI";

/// DMAP 'com.apple.itunes.itms-composerid' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_ITMS_COMPOSERID = // ignore: constant_identifier_names
    "aeCI";

/// DMAP 'com.apple.itunes.content-rating' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_CONTENT_RATING = // ignore: constant_identifier_names
    "aeCR";

/// DMAP 'com.apple.itunes.drm-platform-id' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_DRM_PLATFORM_ID = // ignore: constant_identifier_names
    "aeDP";

/// DMAP 'com.apple.itunes.drm-user-id' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_DRM_USER_ID = // ignore: constant_identifier_names
    "aeDR";

/// DMAP 'com.apple.itunes.drm-versions' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_DRM_VERSIONS = // ignore: constant_identifier_names
    "aeDV";

/// DMAP 'com.apple.itunes.episode-num-str' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_EPISODE_NUM_STR = // ignore: constant_identifier_names
    "aeEN";

/// DMAP 'com.apple.itunes.episode-sort' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_EPISODE_SORT = // ignore: constant_identifier_names
    "aeES";

/// DMAP 'com.apple.itunes.req-fplay' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_REQ_FPLAY = // ignore: constant_identifier_names
    "aeFP";

/// DMAP 'com.apple.itunes.gapless-enc-dr' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_ENC_DR = // ignore: constant_identifier_names
    "aeGD";

/// DMAP 'com.apple.itunes.gapless-enc-del' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_ENC_DEL = // ignore: constant_identifier_names
    "aeGE";

/// DMAP 'com.apple.itunes.gapless-heur' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_HEUR = // ignore: constant_identifier_names
    "aeGH";

/// DMAP 'com.apple.itunes.itms-genreid' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_ITMS_GENREID = // ignore: constant_identifier_names
    "aeGI";

/// DMAP 'com.apple.itunes.gapless-resy' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_RESY = // ignore: constant_identifier_names
    "aeGR";

/// DMAP 'com.apple.itunes.gapless-dur' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_DUR = // ignore: constant_identifier_names
    "aeGU";

/// DMAP 'com.apple.itunes.is-hd-video"' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_IS_HD_VIDEO = // ignore: constant_identifier_names
    "aeHD";

/// DMAP 'com.apple.itunes.has-video' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_HAS_VIDEO = // ignore: constant_identifier_names
    "aeHV";

/// DMAP 'com.apple.itunes.drm-key1-id' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_DRM_KEY1_ID = // ignore: constant_identifier_names
    "aeK1";

/// DMAP 'com.apple.itunes.drm-key2-id' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_DRM_KEY2_ID = // ignore: constant_identifier_names
    "aeK2";

/// DMAP 'com.apple.itunes.extended-media-kind' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_EXTENDED_MEDIA_KIND = // ignore: constant_identifier_names
    "aeMk";

/// DMAP 'com.apple.itunes.mediakind' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_MEDIAKIND = // ignore: constant_identifier_names
    "aeMK";

/// DMAP 'com.apple.itunes.non-drm-user-id' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_NON_DRM_USER_ID = // ignore: constant_identifier_names
    "aeND";

/// DMAP 'com.apple.itunes.network-name' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_NETWORK_NAME = // ignore: constant_identifier_names
    "aeNN";

/// DMAP 'com.apple.itunes.norm-volume' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_NORM_VOLUME = // ignore: constant_identifier_names
    "aeNV";

/// DMAP 'com.apple.itunes.is-podcast' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST = // ignore: constant_identifier_names
    "aePC";

/// DMAP 'com.apple.itunes.itms-playlistid' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_ITMS_PLAYLISTID = // ignore: constant_identifier_names
    "aePI";

/// DMAP 'com.apple.itunes.is-podcast-playlist' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST_PLAYLIST = // ignore: constant_identifier_names
    "aePP";

/// DMAP 'com.apple.itunes.special-playlist' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_SPECIAL_PLAYLIST = // ignore: constant_identifier_names
    "aePS";

/// DMAP 'com.apple.itunes.itms-storefrontid' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_ITMS_STOREFRONTID = // ignore: constant_identifier_names
    "aeSF";

/// DMAP 'com.apple.itunes.saved-genius' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_SAVED_GENIUS = // ignore: constant_identifier_names
    "aeSG";

/// DMAP 'com.apple.itunes.itms-songid' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_ITMS_SONGID = // ignore: constant_identifier_names
    "aeSI";

/// DMAP 'com.apple.itunes.series-name' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_SERIES_NAME = // ignore: constant_identifier_names
    "aeSN";

/// DMAP 'com.apple.itunes.smart-playlist' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_SMART_PLAYLIST = // ignore: constant_identifier_names
    "aeSP";

/// DMAP 'com.apple.itunes.season-num' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_SEASON_NUM = // ignore: constant_identifier_names
    "aeSU";

/// DMAP 'com.apple.itunes.music-sharing-version' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_MUSIC_SHARING_VERSION = // ignore: constant_identifier_names
    "aeSV";

/// DMAP 'daap.songgrouping' code.
const String DMAP_CODE_DAAP_SONGGROUPING = // ignore: constant_identifier_names
    "agrp";

/// DMAP 'daap.databaseplaylists' code.
const String
    DMAP_CODE_DAAP_DATABASEPLAYLISTS = // ignore: constant_identifier_names
    "aply";

/// DMAP 'daap.playlistrepeatmode' code.
const String
    DMAP_CODE_DAAP_PLAYLISTREPEATMODE = // ignore: constant_identifier_names
    "aprm";

/// DMAP 'daap.protocolversion' code.
const String
    DMAP_CODE_DAAP_PROTOCOLVERSION = // ignore: constant_identifier_names
    "apro";

/// DMAP 'daap.playlistshufflemode' code.
const String
    DMAP_CODE_DAAP_PLAYLISTSHUFFLEMODE = // ignore: constant_identifier_names
    "apsm";

/// DMAP 'daap.playlistsongs' code.
const String DMAP_CODE_DAAP_PLAYLISTSONGS = // ignore: constant_identifier_names
    "apso";

/// DMAP 'daap.resolveinfo' code.
const String DMAP_CODE_DAAP_RESOLVEINFO = // ignore: constant_identifier_names
    "arif";

/// DMAP 'daap.resolve' code.
const String DMAP_CODE_DAAP_RESOLVE = // ignore: constant_identifier_names
    "arsv";

/// DMAP 'daap.songalbumartist' code.
const String
    DMAP_CODE_DAAP_SONGALBUMARTIST = // ignore: constant_identifier_names
    "asaa";

/// DMAP 'daap.songalbumid' code.
const String DMAP_CODE_DAAP_SONGALBUMID = // ignore: constant_identifier_names
    "asai";

/// DMAP 'daap.songalbum' code.
const String DMAP_CODE_DAAP_SONGALBUM = // ignore: constant_identifier_names
    "asal";

/// DMAP 'daap.songartist' code.
const String DMAP_CODE_DAAP_SONGARTIST = // ignore: constant_identifier_names
    "asar";

/// DMAP 'daap.bookmarkable' code.
const String DMAP_CODE_DAAP_BOOKMARKABLE = // ignore: constant_identifier_names
    "asbk";

/// DMAP 'daap.songbookmark' code.
const String DMAP_CODE_DAAP_SONGBOOKMARK = // ignore: constant_identifier_names
    "asbo";

/// DMAP 'daap.songbitrate' code.
const String DMAP_CODE_DAAP_SONGBITRATE = // ignore: constant_identifier_names
    "asbr";

/// DMAP 'daap.songbeatsperminute' code.
const String
    DMAP_CODE_DAAP_SONGBEATSPERMINUTE = // ignore: constant_identifier_names
    "asbt";

/// DMAP 'daap.songcodectype' code.
const String DMAP_CODE_DAAP_SONGCODECTYPE = // ignore: constant_identifier_names
    "ascd";

/// DMAP 'daap.songcomment' code.
const String DMAP_CODE_DAAP_SONGCOMMENT = // ignore: constant_identifier_names
    "ascm";

/// DMAP 'daap.songcontentdescription' code.
const String
    DMAP_CODE_DAAP_SONGCONTENTDESCRIPTION = // ignore: constant_identifier_names
    "ascn";

/// DMAP 'daap.songcompilation' code.
const String
    DMAP_CODE_DAAP_SONGCOMPILATION = // ignore: constant_identifier_names
    "asco";

/// DMAP 'daap.songcomposer' code.
const String DMAP_CODE_DAAP_SONGCOMPOSER = // ignore: constant_identifier_names
    "ascp";

/// DMAP 'daap.songcontentrating' code.
const String
    DMAP_CODE_DAAP_SONGCONTENTRATING = // ignore: constant_identifier_names
    "ascr";

/// DMAP 'daap.songcodecsubtype' code.
const String
    DMAP_CODE_DAAP_SONGCODECSUBTYPE = // ignore: constant_identifier_names
    "ascs";

/// DMAP 'daap.songcategory' code.
const String DMAP_CODE_DAAP_SONGCATEGORY = // ignore: constant_identifier_names
    "asct";

/// DMAP 'daap.songdateadded' code.
const String DMAP_CODE_DAAP_SONGDATEADDED = // ignore: constant_identifier_names
    "asda";

/// DMAP 'daap.songdisabled' code.
const String DMAP_CODE_DAAP_SONGDISABLED = // ignore: constant_identifier_names
    "asdb";

/// DMAP 'daap.songdisccount' code.
const String DMAP_CODE_DAAP_SONGDISCCOUNT = // ignore: constant_identifier_names
    "asdc";

/// DMAP 'daap.songdatakind' code.
const String DMAP_CODE_DAAP_SONGDATAKIND = // ignore: constant_identifier_names
    "asdk";

/// DMAP 'daap.songdatemodified' code.
const String
    DMAP_CODE_DAAP_SONGDATEMODIFIED = // ignore: constant_identifier_names
    "asdm";

/// DMAP 'daap.songdiscnumber' code.
const String
    DMAP_CODE_DAAP_SONGDISCKNUMBER = // ignore: constant_identifier_names
    "asdn";

/// DMAP 'daap.songdatepurchased' code.
const String
    DMAP_CODE_DAAP_SONGDATEPURCHASED = // ignore: constant_identifier_names
    "asdp";

/// DMAP 'daap.songdatereleased' code.
const String
    DMAP_CODE_DAAP_SONGDATERELEASED = // ignore: constant_identifier_names
    "asdr";

/// DMAP 'daap.songdescription' code.
const String
    DMAP_CODE_DAAP_SONGDESCRIPTION = // ignore: constant_identifier_names
    "asdt";

/// DMAP 'daap.songextradata' code.
const String DMAP_CODE_DAAP_SONGEXTRADATA = // ignore: constant_identifier_names
    "ased";

/// DMAP 'daap.songeqpreset' code.
const String DMAP_CODE_DAAP_SONGEQPRESET = // ignore: constant_identifier_names
    "aseq";

/// DMAP 'daap.songformat' code.
const String DMAP_CODE_DAAP_SONGFORMAT = // ignore: constant_identifier_names
    "asfm";

/// DMAP 'daap.songgenre' code.
const String DMAP_CODE_DAAP_SONGGENRE = // ignore: constant_identifier_names
    "asgn";

/// DMAP 'daap.songgapless' code.
const String DMAP_CODE_DAAP_SONGGAPLESS = // ignore: constant_identifier_names
    "asgp";

/// DMAP 'daap.songhasbeenplayed' code.
const String
    DMAP_CODE_DAAP_SONGHASBEENPLAYED = // ignore: constant_identifier_names
    "ashp";

/// DMAP 'daap.songkeywords' code.
const String DMAP_CODE_DAAP_SONGKEYWORDS = // ignore: constant_identifier_names
    "asky";

/// DMAP 'daap.songlongcontentdescription' code.
const String
    DMAP_CODE_DAAP_SONGLONGCONTENTDESCRIPTION = // ignore: constant_identifier_names
    "aslc";

/// DMAP 'daap.songlongsize' code.
const String DMAP_CODE_DAAP_SONGLONGSIZE = // ignore: constant_identifier_names
    "asls";

/// DMAP 'daap.songsonpodcasturl' code.
const String
    DMAP_CODE_DAAP_SONGSONPODCASTURL = // ignore: constant_identifier_names
    "aspu";

/// DMAP 'daap.songrelativevolume' code.
const String
    DMAP_CODE_DAAP_SONGRELATIVEVOLUME = // ignore: constant_identifier_names
    "asrv";

/// DMAP 'daap.sortartist' code.
const String DMAP_CODE_DAAP_SORTARTIST = // ignore: constant_identifier_names
    "assa";

/// DMAP 'daap.sortcomposer' code.
const String DMAP_CODE_DAAP_SORTCOMPOSER = // ignore: constant_identifier_names
    "assc";

/// DMAP 'daap.sortalbumartist' code.
const String
    DMAP_CODE_DAAP_SORTALBUMARTIST = // ignore: constant_identifier_names
    "assl";

/// DMAP 'daap.sortname' code.
const String DMAP_CODE_DAAP_SORTNAME = // ignore: constant_identifier_names
    "assn";

/// DMAP 'daap.songstoptime' code.
const String DMAP_CODE_DAAP_SONGSTOPTIME = // ignore: constant_identifier_names
    "assp";

/// DMAP 'daap.songsamplerate' code.
const String
    DMAP_CODE_DAAP_SONGSAMPLERATE = // ignore: constant_identifier_names
    "assr";

/// DMAP 'daap.sortseriesname' code.
const String
    DMAP_CODE_DAAP_SONGSERIESNAME = // ignore: constant_identifier_names
    "asss";

/// DMAP 'daap.songstarttime' code.
const String DMAP_CODE_DAAP_SONGSTARTTIME = // ignore: constant_identifier_names
    "asst";

/// DMAP 'daap.sortalbum' code.
const String DMAP_CODE_DAAP_SORTALBUM = // ignore: constant_identifier_names
    "assu";

/// DMAP 'daap.songsize' code.
const String DMAP_CODE_DAAP_SONGSIZE = // ignore: constant_identifier_names
    "assz";

/// DMAP 'daap.songtrackcount' code.
const String
    DMAP_CODE_DAAP_SONGTRACKCOUNT = // ignore: constant_identifier_names
    "astc";

/// DMAP 'daap.songtime' code.
const String DMAP_CODE_DAAP_SONGTIME = // ignore: constant_identifier_names
    "astm";

/// DMAP 'daap.songtracknumber' code.
const String
    DMAP_CODE_DAAP_SONGTRACKNUMBER = // ignore: constant_identifier_names
    "astn";

/// DMAP 'daap.songdataurl' code.
const String DMAP_CODE_DAAP_SONGDATAURL = // ignore: constant_identifier_names
    "asul";

/// DMAP 'daap.songuserrating' code.
const String
    DMAP_CODE_DAAP_SONGUSERRATING = // ignore: constant_identifier_names
    "asur";

/// DMAP 'daap.songyear' code.
const String DMAP_CODE_DAAP_SONGYEAR = // ignore: constant_identifier_names
    "asyr";

/// DMAP 'daap.supportsextradata' code.
const String
    DMAP_CODE_DAAP_SUPPORTSEXTRADATA = // ignore: constant_identifier_names
    "ated";

/// DMAP 'daap.serverdatabases' code.
const String
    DMAP_CODE_DAAP_SERVERDATABASES = // ignore: constant_identifier_names
    "avdb";

/// DMAP 'com.apple.itunes.jukebox-client-vote' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_CLIENT_VOTE = // ignore: constant_identifier_names
    "ceJC";

/// DMAP 'com.apple.itunes.jukebox-current' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_CURRENT = // ignore: constant_identifier_names
    "ceJI";

/// DMAP 'com.apple.itunes.jukebox-vote' code.
const String
    DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_VOTE = // ignore: constant_identifier_names
    "ceJV";

/// DMAP 'dmap.haschildcontainers' code.
const String
    DMAP_CODE_DMAP_HASCHILDCONTAINERS = // ignore: constant_identifier_names
    "f?ch";

/// DMAP 'dmap.bag' code.
const String DMAP_CODE_DMAP_BAG = "mbcl"; // ignore: constant_identifier_names
/// DMAP 'dmap.contentcodesresponse' code.
const String
    DMAP_CODE_DMAP_CONTENTCODESRESPONSE = // ignore: constant_identifier_names
    "mccr";

/// DMAP 'dmap.contentcodesname' code.
const String
    DMAP_CODE_DMAP_CONTENTCODESNAME = // ignore: constant_identifier_names
    "mcna";

/// DMAP 'dmap.contentcodesnumber' code.
const String
    DMAP_CODE_DMAP_CONTENTCODESNUMBER = // ignore: constant_identifier_names
    "mcnm";

/// DMAP 'dmap.container' code.
const String DMAP_CODE_DMAP_CONTAINER = // ignore: constant_identifier_names
    "mcon";

/// DMAP 'dmap.containercount' code.
const String
    DMAP_CODE_DMAP_CONTAINERCOUNT = // ignore: constant_identifier_names
    "mctc";

/// DMAP 'dmap.containeritemid' code.
const String
    DMAP_CODE_DMAP_CONTAINERITEMID = // ignore: constant_identifier_names
    "mcti";

/// DMAP 'dmap.contentcodestype' code.
const String
    DMAP_CODE_DMAP_CONTENTCODESTYPE = // ignore: constant_identifier_names
    "mcty";

/// DMAP 'dmap.dictionary' code.
const String DMAP_CODE_DMAP_DICTIONARY = // ignore: constant_identifier_names
    "mdcl";

/// DMAP 'dmap.editcommandssupported' code.
const String
    DMAP_CODE_DMAP_EDITCOMMANDSUPPORTED = // ignore: constant_identifier_names
    "meds";

/// DMAP 'dmap.itemid' code.
const String DMAP_CODE_DMAP_ITEMID = // ignore: constant_identifier_names
    "miid";

/// DMAP 'dmap.itemkind' code.
const String DMAP_CODE_DMAP_ITEMKIND = // ignore: constant_identifier_names
    "mikd";

/// DMAP 'dmap.itemcount' code.
const String DMAP_CODE_DMAP_ITEMCOUNT = // ignore: constant_identifier_names
    "mimc";

/// DMAP 'dmap.itemname' code.
const String DMAP_CODE_DMAP_ITEMNAME = // ignore: constant_identifier_names
    "minm";

/// DMAP 'dmap.listing' code.
const String DMAP_CODE_DMAP_LISTING = // ignore: constant_identifier_names
    "mlcl";

/// DMAP 'dmap.sessionid' code.
const String DMAP_CODE_DMAP_SESSIONID = // ignore: constant_identifier_names
    "mlid";

/// DMAP 'dmap.listingitem' code.
const String DMAP_CODE_DMAP_LISTINGITEM = // ignore: constant_identifier_names
    "mlit";

/// DMAP 'dmap.loginresponse' code.
const String DMAP_CODE_DMAP_LOGINRESPONSE = // ignore: constant_identifier_names
    "mlog";

/// DMAP 'dmap.parentcontainerid' code.
const String
    DMAP_CODE_DMAP_PARENTCONTAINERID = // ignore: constant_identifier_names
    "mpco";

/// DMAP 'dmap.persistentid' code.
const String DMAP_CODE_DMAP_PERSISTENTID = // ignore: constant_identifier_names
    "mper";

/// DMAP 'dmap.protocolversion' code.
const String
    DMAP_CODE_DMAP_PROTOCOLVERSION = // ignore: constant_identifier_names
    "mpro";

/// DMAP 'dmap.returnedcount' code.
const String DMAP_CODE_DMAP_RETURNEDCOUNT = // ignore: constant_identifier_names
    "mrco";

/// DMAP 'dmap.supportsautologout' code.
const String
    DMAP_CODE_DMAP_SUPPORTSAUTOLOGOUT = // ignore: constant_identifier_names
    "msal";

/// DMAP 'dmap.authenticationschemes' code.
const String
    DMAP_CODE_DMAP_AUTHENTICATIONSCHEMES = // ignore: constant_identifier_names
    "msas";

/// DMAP 'dmap.authenticationmethod' code.
const String
    DMAP_CODE_DMAP_AUTHENTICATIONMETHOD = // ignore: constant_identifier_names
    "msau";

/// DMAP 'dmap.supportsbrowse' code.
const String
    DMAP_CODE_DMAP_SUPPORTSBROWSE = // ignore: constant_identifier_names
    "msbr";

/// DMAP 'dmap.databasescount' code.
const String
    DMAP_CODE_DMAP_DATABASESCOUNT = // ignore: constant_identifier_names
    "msdc";

/// DMAP 'dmap.supportsextensions' code.
const String
    DMAP_CODE_DMAP_SUPPORTSEXTENSIONS = // ignore: constant_identifier_names
    "msex";

/// DMAP 'dmap.supportsindex' code.
const String DMAP_CODE_DMAP_SUPPORTSINDEX = // ignore: constant_identifier_names
    "msix";

/// DMAP 'dmap.loginrequired' code.
const String DMAP_CODE_DMAP_LOGINREQUIRED = // ignore: constant_identifier_names
    "mslr";

/// DMAP 'dmap.supportspersistentids' code.
const String
    DMAP_CODE_DMAP_SUPPORTSPERSISTENTIDS = // ignore: constant_identifier_names
    "mspi";

/// DMAP 'dmap.supportsquery' code.
const String DMAP_CODE_DMAP_SUPPORTSQUERY = // ignore: constant_identifier_names
    "msqy";

/// DMAP 'dmap.supportsresolve' code.
const String
    DMAP_CODE_DMAP_SUPPORTSRESOLVE = // ignore: constant_identifier_names
    "msrs";

/// DMAP 'dmap.serverinforesponse' code.
const String
    DMAP_CODE_DMAP_SERVERINFORESPONSE = // ignore: constant_identifier_names
    "msrv";

/// DMAP 'dmap.utctime' code.
const String DMAP_CODE_DMAP_UTCTIME = // ignore: constant_identifier_names
    "mstc";

/// DMAP 'dmap.timeoutinterval' code.
const String
    DMAP_CODE_DMAP_TIMEOUTINTERVAL = // ignore: constant_identifier_names
    "mstm";

/// DMAP 'dmap.utcoffset' code.
const String DMAP_CODE_DMAP_UTCOFFSET = // ignore: constant_identifier_names
    "msto";

/// DMAP 'dmap.statusstring' code.
const String DMAP_CODE_DMAP_STATUSSTRING = // ignore: constant_identifier_names
    "msts";

/// DMAP 'dmap.status' code.
const String DMAP_CODE_DMAP_STATUS = // ignore: constant_identifier_names
    "mstt";

/// DMAP 'dmap.supportsupdate' code.
const String
    DMAP_CODE_DMAP_SUPPORTSUPDATE = // ignore: constant_identifier_names
    "msup";

/// DMAP 'dmap.specifiedtotalcount' code.
const String
    DMAP_CODE_DMAP_SPECIFIEDTOTALCOUNT = // ignore: constant_identifier_names
    "mtco";

/// DMAP 'dmap.deletedidlisting' code.
const String
    DMAP_CODE_DMAP_DELETEDIDLISTING = // ignore: constant_identifier_names
    "mudl";

/// DMAP 'dmap.updateresponse' code.
const String
    DMAP_CODE_DMAP_UPDATERESPONSE = // ignore: constant_identifier_names
    "mupd";

/// DMAP 'dmap.serverrevision' code.
const String
    DMAP_CODE_DMAP_SERVERREVISION = // ignore: constant_identifier_names
    "musr";

/// DMAP 'dmap.updatetype' code.
const String DMAP_CODE_DMAP_UPDATETYPE = // ignore: constant_identifier_names
    "muty";

/// DMAP 'dpap.protocolversion' code.
const String
    DMAP_CODE_DPAP_PROTOCOLVERSION = // ignore: constant_identifier_names
    "ppro";

/// DMAP 'dpap.unknown' code.
const String DMAP_CODE_DPAP_UNKNOWN = // ignore: constant_identifier_names
    "pret";

/// DMAP codes mapping.
final Map<String, DmapCode> dmapCodeTypes = {
  DMAP_CODE_COM_APPLE_ITUNES_REQ_FPLAY_UNKNOWN: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_REQ_FPLAY_UNKNOWN,
      "com.apple.itunes.req-fplay",
      byte),
  DMAP_CODE_DAAP_BROWSEALBUMLISTING: DmapCode(
      DMAP_CODE_DAAP_BROWSEALBUMLISTING, "daap.browsealbumlisting", container),
  DMAP_CODE_DAAP_BROWSEARTISTLISTING: DmapCode(
      DMAP_CODE_DAAP_BROWSEARTISTLISTING,
      "daap.browseartistlisting",
      container),
  DMAP_CODE_DAAP_BROWSECOMPOSERLISTING: DmapCode(
      DMAP_CODE_DAAP_BROWSECOMPOSERLISTING,
      "daap.browsecomposerlisting",
      container),
  DMAP_CODE_DAAP_BROWSEGENRELISTING: DmapCode(
      DMAP_CODE_DAAP_BROWSEGENRELISTING, "daap.browsegenrelisting", container),
  DMAP_CODE_DAAP_BASEPLAYLIST:
      DmapCode(DMAP_CODE_DAAP_BASEPLAYLIST, "daap.baseplaylist", byte),
  DMAP_CODE_DAAP_DATABASEBROWSE:
      DmapCode(DMAP_CODE_DAAP_DATABASEBROWSE, "daap.databasebrowse", container),
  DMAP_CODE_DAAP_DATABASESONGS:
      DmapCode(DMAP_CODE_DAAP_DATABASESONGS, "daap.databasesongs", container),
  DMAP_CODE_COM_APPLE_ITUNES_ADAM_IDS_ARRAY: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_ADAM_IDS_ARRAY,
      "com.apple.itunes.adam-ids-array",
      container),
  DMAP_CODE_COM_APPLE_ITUNES_ITMS_ARTISTID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_ITMS_ARTISTID,
      "com.apple.itunes.itms-artistid",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_ITMS_COMPOSERID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_ITMS_COMPOSERID,
      "com.apple.itunes.itms-composerid",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_CONTENT_RATING: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_CONTENT_RATING,
      "com.apple.itunes.content-rating",
      string),
  DMAP_CODE_COM_APPLE_ITUNES_DRM_PLATFORM_ID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_DRM_PLATFORM_ID,
      "com.apple.itunes.drm-platform-id",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_DRM_USER_ID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_DRM_USER_ID,
      "com.apple.itunes.drm-user-id",
      long),
  DMAP_CODE_COM_APPLE_ITUNES_DRM_VERSIONS: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_DRM_VERSIONS,
      "com.apple.itunes.drm-versions",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_EPISODE_NUM_STR: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_EPISODE_NUM_STR,
      "com.apple.itunes.episode-num-str",
      string),
  DMAP_CODE_COM_APPLE_ITUNES_EPISODE_SORT: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_EPISODE_SORT,
      "com.apple.itunes.episode-sort",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_REQ_FPLAY: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_REQ_FPLAY, "com.apple.itunes.req-fplay", byte),
  DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_ENC_DR: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_ENC_DR,
      "com.apple.itunes.gapless-enc-dr",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_ENC_DEL: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_ENC_DEL,
      "com.apple.itunes.gapless-enc-del",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_HEUR: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_HEUR,
      "com.apple.itunes.gapless-heur",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_ITMS_GENREID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_ITMS_GENREID,
      "com.apple.itunes.itms-genreid",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_RESY: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_RESY,
      "com.apple.itunes.gapless-resy",
      long),
  DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_DUR: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_DUR,
      "com.apple.itunes.gapless-dur",
      long),
  DMAP_CODE_COM_APPLE_ITUNES_IS_HD_VIDEO: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_IS_HD_VIDEO,
      "com.apple.itunes.is-hd-video",
      byte),
  DMAP_CODE_COM_APPLE_ITUNES_HAS_VIDEO: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_HAS_VIDEO, "com.apple.itunes.has-video", byte),
  DMAP_CODE_COM_APPLE_ITUNES_DRM_KEY1_ID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_DRM_KEY1_ID,
      "com.apple.itunes.drm-key1-id",
      long),
  DMAP_CODE_COM_APPLE_ITUNES_DRM_KEY2_ID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_DRM_KEY2_ID,
      "com.apple.itunes.drm-key2-id",
      long),
  DMAP_CODE_COM_APPLE_ITUNES_EXTENDED_MEDIA_KIND: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_EXTENDED_MEDIA_KIND,
      "com.apple.itunes.extended-media-kind",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_MEDIAKIND: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_MEDIAKIND, "com.apple.itunes.mediakind", byte),
  DMAP_CODE_COM_APPLE_ITUNES_NON_DRM_USER_ID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_NON_DRM_USER_ID,
      "com.apple.itunes.non-drm-user-id",
      long),
  DMAP_CODE_COM_APPLE_ITUNES_NETWORK_NAME: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_NETWORK_NAME,
      "com.apple.itunes.network-name",
      string),
  DMAP_CODE_COM_APPLE_ITUNES_NORM_VOLUME: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_NORM_VOLUME,
      "com.apple.itunes.norm-volume",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST,
      "com.apple.itunes.is-podcast",
      byte),
  DMAP_CODE_COM_APPLE_ITUNES_ITMS_PLAYLISTID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_ITMS_PLAYLISTID,
      "com.apple.itunes.itms-playlistid",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST_PLAYLIST: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST_PLAYLIST,
      "com.apple.itunes.is-podcast-playlist",
      byte),
  DMAP_CODE_COM_APPLE_ITUNES_SPECIAL_PLAYLIST: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_SPECIAL_PLAYLIST,
      "com.apple.itunes.special-playlist",
      byte),
  DMAP_CODE_COM_APPLE_ITUNES_ITMS_STOREFRONTID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_ITMS_STOREFRONTID,
      "com.apple.itunes.itms-storefrontid",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_SAVED_GENIUS: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_SAVED_GENIUS,
      "com.apple.itunes.saved-genius",
      byte),
  DMAP_CODE_COM_APPLE_ITUNES_ITMS_SONGID: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_ITMS_SONGID,
      "com.apple.itunes.itms-songid",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_SERIES_NAME: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_SERIES_NAME,
      "com.apple.itunes.series-name",
      string),
  DMAP_CODE_COM_APPLE_ITUNES_SMART_PLAYLIST: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_SMART_PLAYLIST,
      "com.apple.itunes.smart-playlist",
      byte),
  DMAP_CODE_COM_APPLE_ITUNES_SEASON_NUM: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_SEASON_NUM,
      "com.apple.itunes.season-num",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_MUSIC_SHARING_VERSION: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_MUSIC_SHARING_VERSION,
      "com.apple.itunes.music-sharing-version",
      integer),
  DMAP_CODE_DAAP_SONGGROUPING:
      DmapCode(DMAP_CODE_DAAP_SONGGROUPING, "daap.songgrouping", string),
  DMAP_CODE_DAAP_DATABASEPLAYLISTS: DmapCode(
      DMAP_CODE_DAAP_DATABASEPLAYLISTS, "daap.databaseplaylists", container),
  DMAP_CODE_DAAP_PLAYLISTREPEATMODE: DmapCode(
      DMAP_CODE_DAAP_PLAYLISTREPEATMODE, "daap.playlistrepeatmode", byte),
  DMAP_CODE_DAAP_PROTOCOLVERSION:
      DmapCode(DMAP_CODE_DAAP_PROTOCOLVERSION, "daap.protocolversion", version),
  DMAP_CODE_DAAP_PLAYLISTSHUFFLEMODE: DmapCode(
      DMAP_CODE_DAAP_PLAYLISTSHUFFLEMODE, "daap.playlistshufflemode", byte),
  DMAP_CODE_DAAP_PLAYLISTSONGS:
      DmapCode(DMAP_CODE_DAAP_PLAYLISTSONGS, "daap.playlistsongs", container),
  DMAP_CODE_DAAP_RESOLVEINFO:
      DmapCode(DMAP_CODE_DAAP_RESOLVEINFO, "daap.resolveinfo", container),
  DMAP_CODE_DAAP_RESOLVE:
      DmapCode(DMAP_CODE_DAAP_RESOLVE, "daap.resolve", container),
  DMAP_CODE_DAAP_SONGALBUMARTIST:
      DmapCode(DMAP_CODE_DAAP_SONGALBUMARTIST, "daap.songalbumartist", string),
  DMAP_CODE_DAAP_SONGALBUMID:
      DmapCode(DMAP_CODE_DAAP_SONGALBUMID, "daap.songalbumid", long),
  DMAP_CODE_DAAP_SONGALBUM:
      DmapCode(DMAP_CODE_DAAP_SONGALBUM, "daap.songalbum", string),
  DMAP_CODE_DAAP_SONGARTIST:
      DmapCode(DMAP_CODE_DAAP_SONGARTIST, "daap.songartist", string),
  DMAP_CODE_DAAP_BOOKMARKABLE:
      DmapCode(DMAP_CODE_DAAP_BOOKMARKABLE, "daap.bookmarkable", byte),
  DMAP_CODE_DAAP_SONGBOOKMARK:
      DmapCode(DMAP_CODE_DAAP_SONGBOOKMARK, "daap.songbookmark", integer),
  DMAP_CODE_DAAP_SONGBITRATE:
      DmapCode(DMAP_CODE_DAAP_SONGBITRATE, "daap.songbitrate", short),
  DMAP_CODE_DAAP_SONGBEATSPERMINUTE: DmapCode(
      DMAP_CODE_DAAP_SONGBEATSPERMINUTE, "daap.songbeatsperminute", short),
  DMAP_CODE_DAAP_SONGCODECTYPE:
      DmapCode(DMAP_CODE_DAAP_SONGCODECTYPE, "daap.songcodectype", integer),
  DMAP_CODE_DAAP_SONGCOMMENT:
      DmapCode(DMAP_CODE_DAAP_SONGCOMMENT, "daap.songcomment", string),
  DMAP_CODE_DAAP_SONGCONTENTDESCRIPTION: DmapCode(
      DMAP_CODE_DAAP_SONGCONTENTDESCRIPTION,
      "daap.songcontentdescription",
      string),
  DMAP_CODE_DAAP_SONGCOMPILATION:
      DmapCode(DMAP_CODE_DAAP_SONGCOMPILATION, "daap.songcompilation", byte),
  DMAP_CODE_DAAP_SONGCOMPOSER:
      DmapCode(DMAP_CODE_DAAP_SONGCOMPOSER, "daap.songcomposer", string),
  DMAP_CODE_DAAP_SONGCONTENTRATING: DmapCode(
      DMAP_CODE_DAAP_SONGCONTENTRATING, "daap.songcontentrating", byte),
  DMAP_CODE_DAAP_SONGCODECSUBTYPE: DmapCode(
      DMAP_CODE_DAAP_SONGCODECSUBTYPE, "daap.songcodecsubtype", integer),
  DMAP_CODE_DAAP_SONGCATEGORY:
      DmapCode(DMAP_CODE_DAAP_SONGCATEGORY, "daap.songcategory", string),
  DMAP_CODE_DAAP_SONGDATEADDED:
      DmapCode(DMAP_CODE_DAAP_SONGDATEADDED, "daap.songdateadded", timestamp),
  DMAP_CODE_DAAP_SONGDISABLED:
      DmapCode(DMAP_CODE_DAAP_SONGDISABLED, "daap.songdisabled", byte),
  DMAP_CODE_DAAP_SONGDISCCOUNT:
      DmapCode(DMAP_CODE_DAAP_SONGDISCCOUNT, "daap.songdisccount", short),
  DMAP_CODE_DAAP_SONGDATAKIND:
      DmapCode(DMAP_CODE_DAAP_SONGDATAKIND, "daap.songdatakind", byte),
  DMAP_CODE_DAAP_SONGDATEMODIFIED: DmapCode(
      DMAP_CODE_DAAP_SONGDATEMODIFIED, "daap.songdatemodified", timestamp),
  DMAP_CODE_DAAP_SONGDISCKNUMBER:
      DmapCode(DMAP_CODE_DAAP_SONGDISCKNUMBER, "daap.songdiscnumber", short),
  DMAP_CODE_DAAP_SONGDATEPURCHASED: DmapCode(
      DMAP_CODE_DAAP_SONGDATEPURCHASED, "daap.songdatepurchased", timestamp),
  DMAP_CODE_DAAP_SONGDATERELEASED: DmapCode(
      DMAP_CODE_DAAP_SONGDATERELEASED, "daap.songdatereleased", timestamp),
  DMAP_CODE_DAAP_SONGDESCRIPTION:
      DmapCode(DMAP_CODE_DAAP_SONGDESCRIPTION, "daap.songdescription", string),
  DMAP_CODE_DAAP_SONGEXTRADATA:
      DmapCode(DMAP_CODE_DAAP_SONGEXTRADATA, "daap.songextradata", short),
  DMAP_CODE_DAAP_SONGEQPRESET:
      DmapCode(DMAP_CODE_DAAP_SONGEQPRESET, "daap.songeqpreset", string),
  DMAP_CODE_DAAP_SONGFORMAT:
      DmapCode(DMAP_CODE_DAAP_SONGFORMAT, "daap.songformat", string),
  DMAP_CODE_DAAP_SONGGENRE:
      DmapCode(DMAP_CODE_DAAP_SONGGENRE, "daap.songgenre", string),
  DMAP_CODE_DAAP_SONGGAPLESS:
      DmapCode(DMAP_CODE_DAAP_SONGGAPLESS, "daap.songgapless", byte),
  DMAP_CODE_DAAP_SONGHASBEENPLAYED: DmapCode(
      DMAP_CODE_DAAP_SONGHASBEENPLAYED, "daap.songhasbeenplayed", byte),
  DMAP_CODE_DAAP_SONGKEYWORDS:
      DmapCode(DMAP_CODE_DAAP_SONGKEYWORDS, "daap.songkeywords", string),
  DMAP_CODE_DAAP_SONGLONGCONTENTDESCRIPTION: DmapCode(
      DMAP_CODE_DAAP_SONGLONGCONTENTDESCRIPTION,
      "daap.songlongcontentdescription",
      string),
  DMAP_CODE_DAAP_SONGLONGSIZE:
      DmapCode(DMAP_CODE_DAAP_SONGLONGSIZE, "daap.songlongsize", string),
  DMAP_CODE_DAAP_SONGSONPODCASTURL: DmapCode(
      DMAP_CODE_DAAP_SONGSONPODCASTURL, "daap.songsonpodcasturl", string),
  DMAP_CODE_DAAP_SONGRELATIVEVOLUME: DmapCode(DMAP_CODE_DAAP_SONGRELATIVEVOLUME,
      "daap.songrelativevolume", unsignedByte),
  DMAP_CODE_DAAP_SORTARTIST:
      DmapCode(DMAP_CODE_DAAP_SORTARTIST, "daap.sortartist", string),
  DMAP_CODE_DAAP_SORTCOMPOSER:
      DmapCode(DMAP_CODE_DAAP_SORTCOMPOSER, "daap.sortcomposer", string),
  DMAP_CODE_DAAP_SORTALBUMARTIST:
      DmapCode(DMAP_CODE_DAAP_SORTALBUMARTIST, "daap.sortalbumartist", string),
  DMAP_CODE_DAAP_SORTNAME:
      DmapCode(DMAP_CODE_DAAP_SORTNAME, "daap.sortname", string),
  DMAP_CODE_DAAP_SONGSTOPTIME:
      DmapCode(DMAP_CODE_DAAP_SONGSTOPTIME, "daap.songstoptime", integer),
  DMAP_CODE_DAAP_SONGSAMPLERATE:
      DmapCode(DMAP_CODE_DAAP_SONGSAMPLERATE, "daap.songsamplerate", integer),
  DMAP_CODE_DAAP_SONGSERIESNAME:
      DmapCode(DMAP_CODE_DAAP_SONGSERIESNAME, "daap.sortseriesname", string),
  DMAP_CODE_DAAP_SONGSTARTTIME:
      DmapCode(DMAP_CODE_DAAP_SONGSTARTTIME, "daap.songstarttime", integer),
  DMAP_CODE_DAAP_SORTALBUM:
      DmapCode(DMAP_CODE_DAAP_SORTALBUM, "daap.sortalbum", string),
  DMAP_CODE_DAAP_SONGSIZE:
      DmapCode(DMAP_CODE_DAAP_SONGSIZE, "daap.songsize", integer),
  DMAP_CODE_DAAP_SONGTRACKCOUNT:
      DmapCode(DMAP_CODE_DAAP_SONGTRACKCOUNT, "daap.songtrackcount", short),
  DMAP_CODE_DAAP_SONGTIME:
      DmapCode(DMAP_CODE_DAAP_SONGTIME, "daap.songtime", integer),
  DMAP_CODE_DAAP_SONGTRACKNUMBER:
      DmapCode(DMAP_CODE_DAAP_SONGTRACKNUMBER, "daap.songtracknumber", short),
  DMAP_CODE_DAAP_SONGDATAURL:
      DmapCode(DMAP_CODE_DAAP_SONGDATAURL, "daap.songdataurl", string),
  DMAP_CODE_DAAP_SONGUSERRATING:
      DmapCode(DMAP_CODE_DAAP_SONGUSERRATING, "daap.songuserrating", byte),
  DMAP_CODE_DAAP_SONGYEAR:
      DmapCode(DMAP_CODE_DAAP_SONGYEAR, "daap.songyear", short),
  DMAP_CODE_DAAP_SUPPORTSEXTRADATA: DmapCode(
      DMAP_CODE_DAAP_SUPPORTSEXTRADATA, "daap.supportsextradata", short),
  DMAP_CODE_DAAP_SERVERDATABASES: DmapCode(
      DMAP_CODE_DAAP_SERVERDATABASES, "daap.serverdatabases", container),
  DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_CLIENT_VOTE: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_CLIENT_VOTE,
      "com.apple.itunes.jukebox-client-vote",
      unsignedByte),
  DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_CURRENT: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_CURRENT,
      "com.apple.itunes.jukebox-current",
      integer),
  DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_VOTE: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNES_JUKEBOX_VOTE,
      "com.apple.itunes.jukebox-vote",
      integer),
  DMAP_CODE_DMAP_HASCHILDCONTAINERS: DmapCode(
      DMAP_CODE_DMAP_HASCHILDCONTAINERS, "dmap.haschildcontainers", byte),
  DMAP_CODE_DMAP_BAG: DmapCode(DMAP_CODE_DMAP_BAG, "dmap.bag", container),
  DMAP_CODE_DMAP_CONTENTCODESRESPONSE: DmapCode(
      DMAP_CODE_DMAP_CONTENTCODESRESPONSE,
      "dmap.contentcodesresponse",
      container),
  DMAP_CODE_DMAP_CONTENTCODESNAME: DmapCode(
      DMAP_CODE_DMAP_CONTENTCODESNAME, "dmap.contentcodesname", string),
  DMAP_CODE_DMAP_CONTENTCODESNUMBER: DmapCode(
      DMAP_CODE_DMAP_CONTENTCODESNUMBER, "dmap.contentcodesnumber", integer),
  DMAP_CODE_DMAP_CONTAINER:
      DmapCode(DMAP_CODE_DMAP_CONTAINER, "dmap.container", container),
  DMAP_CODE_DMAP_CONTAINERCOUNT:
      DmapCode(DMAP_CODE_DMAP_CONTAINERCOUNT, "dmap.containercount", integer),
  DMAP_CODE_DMAP_CONTAINERITEMID:
      DmapCode(DMAP_CODE_DMAP_CONTAINERITEMID, "dmap.containeritemid", integer),
  DMAP_CODE_DMAP_CONTENTCODESTYPE:
      DmapCode(DMAP_CODE_DMAP_CONTENTCODESTYPE, "dmap.contentcodestype", short),
  DMAP_CODE_DMAP_DICTIONARY:
      DmapCode(DMAP_CODE_DMAP_DICTIONARY, "dmap.dictionary", container),
  DMAP_CODE_DMAP_EDITCOMMANDSUPPORTED: DmapCode(
      DMAP_CODE_DMAP_EDITCOMMANDSUPPORTED, "dmap.editcommandssupported", long),
  DMAP_CODE_DMAP_ITEMID:
      DmapCode(DMAP_CODE_DMAP_ITEMID, "dmap.itemid", integer),
  DMAP_CODE_DMAP_ITEMKIND:
      DmapCode(DMAP_CODE_DMAP_ITEMKIND, "dmap.itemkind", byte),
  DMAP_CODE_DMAP_ITEMCOUNT:
      DmapCode(DMAP_CODE_DMAP_ITEMCOUNT, "dmap.itemcount", integer),
  DMAP_CODE_DMAP_ITEMNAME:
      DmapCode(DMAP_CODE_DMAP_ITEMNAME, "dmap.itemname", string),
  DMAP_CODE_DMAP_LISTING:
      DmapCode(DMAP_CODE_DMAP_LISTING, "dmap.listing", container),
  DMAP_CODE_DMAP_SESSIONID:
      DmapCode(DMAP_CODE_DMAP_SESSIONID, "dmap.sessionid", integer),
  DMAP_CODE_DMAP_LISTINGITEM:
      DmapCode(DMAP_CODE_DMAP_LISTINGITEM, "dmap.listingitem", container),
  DMAP_CODE_DMAP_LOGINRESPONSE:
      DmapCode(DMAP_CODE_DMAP_LOGINRESPONSE, "dmap.loginresponse", container),
  DMAP_CODE_DMAP_PARENTCONTAINERID: DmapCode(
      DMAP_CODE_DMAP_PARENTCONTAINERID, "dmap.parentcontainerid", integer),
  DMAP_CODE_DMAP_PERSISTENTID:
      DmapCode(DMAP_CODE_DMAP_PERSISTENTID, "dmap.persistentid", long),
  DMAP_CODE_DMAP_PROTOCOLVERSION:
      DmapCode(DMAP_CODE_DMAP_PROTOCOLVERSION, "dmap.protocolversion", version),
  DMAP_CODE_DMAP_RETURNEDCOUNT:
      DmapCode(DMAP_CODE_DMAP_RETURNEDCOUNT, "dmap.returnedcount", integer),
  DMAP_CODE_DMAP_SUPPORTSAUTOLOGOUT: DmapCode(
      DMAP_CODE_DMAP_SUPPORTSAUTOLOGOUT, "dmap.supportsautologout", byte),
  DMAP_CODE_DMAP_AUTHENTICATIONSCHEMES: DmapCode(
      DMAP_CODE_DMAP_AUTHENTICATIONSCHEMES,
      "dmap.authenticationschemes",
      integer),
  DMAP_CODE_DMAP_AUTHENTICATIONMETHOD: DmapCode(
      DMAP_CODE_DMAP_AUTHENTICATIONMETHOD, "dmap.authenticationmethod", byte),
  DMAP_CODE_DMAP_SUPPORTSBROWSE:
      DmapCode(DMAP_CODE_DMAP_SUPPORTSBROWSE, "dmap.supportsbrowse", byte),
  DMAP_CODE_DMAP_DATABASESCOUNT:
      DmapCode(DMAP_CODE_DMAP_DATABASESCOUNT, "dmap.databasescount", integer),
  DMAP_CODE_DMAP_SUPPORTSEXTENSIONS: DmapCode(
      DMAP_CODE_DMAP_SUPPORTSEXTENSIONS, "dmap.supportsextensions", byte),
  DMAP_CODE_DMAP_SUPPORTSINDEX:
      DmapCode(DMAP_CODE_DMAP_SUPPORTSINDEX, "dmap.supportsindex", byte),
  DMAP_CODE_DMAP_LOGINREQUIRED:
      DmapCode(DMAP_CODE_DMAP_LOGINREQUIRED, "dmap.loginrequired", byte),
  DMAP_CODE_DMAP_SUPPORTSPERSISTENTIDS: DmapCode(
      DMAP_CODE_DMAP_SUPPORTSPERSISTENTIDS, "dmap.supportspersistentids", byte),
  DMAP_CODE_DMAP_SUPPORTSQUERY:
      DmapCode(DMAP_CODE_DMAP_SUPPORTSQUERY, "dmap.supportsquery", byte),
  DMAP_CODE_DMAP_SUPPORTSRESOLVE:
      DmapCode(DMAP_CODE_DMAP_SUPPORTSRESOLVE, "dmap.supportsresolve", byte),
  DMAP_CODE_DMAP_SERVERINFORESPONSE: DmapCode(
      DMAP_CODE_DMAP_SERVERINFORESPONSE, "dmap.serverinforesponse", container),
  DMAP_CODE_DMAP_UTCTIME:
      DmapCode(DMAP_CODE_DMAP_UTCTIME, "dmap.utctime", timestamp),
  DMAP_CODE_DMAP_TIMEOUTINTERVAL:
      DmapCode(DMAP_CODE_DMAP_TIMEOUTINTERVAL, "dmap.timeoutinterval", integer),
  DMAP_CODE_DMAP_UTCOFFSET:
      DmapCode(DMAP_CODE_DMAP_UTCOFFSET, "dmap.utcoffset", unsignedInteger),
  DMAP_CODE_DMAP_STATUSSTRING:
      DmapCode(DMAP_CODE_DMAP_STATUSSTRING, "dmap.statusstring", string),
  DMAP_CODE_DMAP_STATUS:
      DmapCode(DMAP_CODE_DMAP_STATUS, "dmap.status", integer),
  DMAP_CODE_DMAP_SUPPORTSUPDATE:
      DmapCode(DMAP_CODE_DMAP_SUPPORTSUPDATE, "dmap.supportsupdate", byte),
  DMAP_CODE_DMAP_SPECIFIEDTOTALCOUNT: DmapCode(
      DMAP_CODE_DMAP_SPECIFIEDTOTALCOUNT, "dmap.specifiedtotalcount", integer),
  DMAP_CODE_DMAP_DELETEDIDLISTING: DmapCode(
      DMAP_CODE_DMAP_DELETEDIDLISTING, "dmap.deletedidlisting", container),
  DMAP_CODE_DMAP_UPDATERESPONSE:
      DmapCode(DMAP_CODE_DMAP_UPDATERESPONSE, "dmap.updateresponse", container),
  DMAP_CODE_DMAP_SERVERREVISION:
      DmapCode(DMAP_CODE_DMAP_SERVERREVISION, "dmap.serverrevision", integer),
  DMAP_CODE_DMAP_UPDATETYPE:
      DmapCode(DMAP_CODE_DMAP_UPDATETYPE, "dmap.updatetype", byte),
  DMAP_CODE_DPAP_PROTOCOLVERSION:
      DmapCode(DMAP_CODE_DPAP_PROTOCOLVERSION, "dpap.protocolversion", integer),
  DMAP_CODE_DPAP_UNKNOWN:
      DmapCode(DMAP_CODE_DPAP_UNKNOWN, "dpap.unknown", container),
};

/// HTTP request headers payload.
final Map<String, String> requestHeaders = {
  "Client-DAAP-Version": "3.0",
  "Client-DAAP-Access-Index": "2",
  "User-Agent": "daapc/0.0.0 (https://github.com/vint21h/dart-daap-client/)",
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

/// Serveer info URL.
const String serverInfoUrlPath = "server-info";

/// Update URL.
const String updateUrlPath = "update";

/// Song URL.
const String songUrlPath = "databases/{databaseId}/items/{songId}.{songFormat}";

/// Queries meta's defaults.

/// Default database query meta codes.
const List<String> databaseQueryDefaultMetaCodes = [
  DMAP_CODE_COM_APPLE_ITUNES_NORM_VOLUME,
  DMAP_CODE_DAAP_SONGALBUMARTIST,
  DMAP_CODE_DAAP_SONGARTIST,
  DMAP_CODE_DAAP_SONGBITRATE,
  DMAP_CODE_DAAP_SONGBEATSPERMINUTE,
  DMAP_CODE_DAAP_SONGCOMMENT,
  DMAP_CODE_DAAP_SONGCOMPILATION,
  DMAP_CODE_DAAP_SONGCOMPOSER,
  DMAP_CODE_DAAP_SONGDATEADDED,
  DMAP_CODE_DAAP_SONGDISABLED,
  DMAP_CODE_DAAP_SONGDISCCOUNT,
  DMAP_CODE_DAAP_SONGDATAKIND,
  DMAP_CODE_DAAP_SONGDATEMODIFIED,
  DMAP_CODE_DAAP_SONGDISCKNUMBER,
  DMAP_CODE_DAAP_SONGDESCRIPTION,
  DMAP_CODE_DAAP_SONGEQPRESET,
  DMAP_CODE_DAAP_SONGFORMAT,
  DMAP_CODE_DAAP_SONGGENRE,
  DMAP_CODE_DAAP_SONGRELATIVEVOLUME,
  DMAP_CODE_DAAP_SONGSTOPTIME,
  DMAP_CODE_DAAP_SONGSAMPLERATE,
  DMAP_CODE_DAAP_SONGSTARTTIME,
  DMAP_CODE_DAAP_SONGSIZE,
  DMAP_CODE_DAAP_SONGTRACKCOUNT,
  DMAP_CODE_DAAP_SONGTIME,
  DMAP_CODE_DAAP_SONGTRACKNUMBER,
  DMAP_CODE_DAAP_SONGDATAURL,
  DMAP_CODE_DAAP_SONGUSERRATING,
  DMAP_CODE_DAAP_SONGYEAR,
  DMAP_CODE_DMAP_ITEMID,
  DMAP_CODE_DMAP_ITEMKIND,
  DMAP_CODE_DMAP_ITEMNAME,
  DMAP_CODE_DMAP_PERSISTENTID,
  DMAP_CODE_DAAP_SONGALBUM,
];

/// Default playlists query meta codes.
const List<String> playlistsQueryDefaultMetaCodes = [
  DMAP_CODE_DAAP_BASEPLAYLIST,
  DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST_PLAYLIST,
  DMAP_CODE_COM_APPLE_ITUNES_SPECIAL_PLAYLIST,
  DMAP_CODE_COM_APPLE_ITUNES_SAVED_GENIUS,
  DMAP_CODE_COM_APPLE_ITUNES_SMART_PLAYLIST,
  DMAP_CODE_DMAP_HASCHILDCONTAINERS,
  DMAP_CODE_DMAP_ITEMID,
  DMAP_CODE_DMAP_ITEMCOUNT,
  DMAP_CODE_DMAP_ITEMNAME,
  DMAP_CODE_DMAP_LISTINGITEM,
  DMAP_CODE_DMAP_PARENTCONTAINERID,
  DMAP_CODE_DMAP_PERSISTENTID,
];

/// Default playlist query meta codes.
const List<String> playlistQueryDefaultMetaCodes = [
  DMAP_CODE_DAAP_SONGALBUMARTIST,
  DMAP_CODE_DAAP_SONGARTIST,
  DMAP_CODE_DAAP_SONGFORMAT,
  DMAP_CODE_DAAP_SONGGENRE,
  DMAP_CODE_DAAP_SONGSIZE,
  DMAP_CODE_DAAP_SONGTIME,
  DMAP_CODE_DAAP_SONGTRACKNUMBER,
  DMAP_CODE_DAAP_SONGYEAR,
  DMAP_CODE_DMAP_CONTAINERITEMID,
  DMAP_CODE_DMAP_ITEMID,
  DMAP_CODE_DMAP_ITEMKIND,
  DMAP_CODE_DMAP_ITEMNAME,
  DMAP_CODE_DAAP_SONGALBUM,
];
