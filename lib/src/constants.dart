// dart-daap-client
// lib/src/constants.dart

import "objects.dart";

/// DMAP data types.
const int byte = 1; // Int8
const int unsignedByte = 2; // Uint8
const int short = 3; // Int16
const int unsignedShort = 4; // Uint16
const int integer = 5; // Int32
const int unsignedInteger = 6; // Int32
const int long = 7; // Int64
const int unsignedLong = 8; // Uint64
const int string = 9; // String
const int timestamp = 10; // double
const int version = 11; // Uint32
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
const String DMAP_CODE_COM_APPLE_ITUNES_REQ_FPLAY_UNKNOWN = "????";
const String DMAP_CODE_DAAP_BROWSEALBUMLISTING = "abal";
const String DMAP_CODE_DAAP_BROWSEARTISTLISTING = "abar";
const String DMAP_CODE_DAAP_BROWSECOMPOSERLISTING = "abcp";
const String DMAP_CODE_DAAP_BROWSEGENRELISTING = "abgn";
const String DMAP_CODE_DAAP_BASEPLAYLIST = "abpl";
const String DMAP_CODE_DAAP_DATABASEBROWSE = "abro";
const String DMAP_CODE_DAAP_DATABASESONGS = "adbs";
const String DMAP_CODE_COM_APPLE_ITUNES_ADAM_IDS_ARRAY = "aeAD";
const String DMAP_CODE_COM_APPLE_ITUNES_ITMS_ARTISTID = "aeAI";
const String DMAP_CODE_COM_APPLE_ITUNES_ITMS_COMPOSERID = "aeCI";
const String DMAP_CODE_COM_APPLE_ITUNES_CONTENT_RATING = "aeCR";
const String DMAP_CODE_COM_APPLE_ITUNES_DRM_PLATFORM_ID = "aeDP";
const String DMAP_CODE_COM_APPLE_ITUNES_DRM_USER_ID = "aeDR";
const String DMAP_CODE_COM_APPLE_ITUNES_DRM_VERSIONS = "aeDV";
const String DMAP_CODE_COM_APPLE_ITUNES_EPISODE_NUM_STR = "aeEN";
const String DMAP_CODE_COM_APPLE_ITUNES_EPISODE_SORT = "aeES";
const String DMAP_CODE_COM_APPLE_ITUNES_REQ_FPLAY = "aeFP";
const String DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_ENC_DR = "aeGD";
const String DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_ENC_DEL = "aeGE";
const String DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_HEUR = "aeGH";
const String DMAP_CODE_COM_APPLE_ITUNES_ITMS_GENREID = "aeGI";
const String DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_RESY = "aeGR";
const String DMAP_CODE_COM_APPLE_ITUNES_GAPLESS_DUR = "aeGU";
const String DMAP_CODE_COM_APPLE_ITUNES_IS_HD_VIDEO = "aeHD";
const String DMAP_CODE_COM_APPLE_ITUNES_HAS_VIDEO = "aeHV";
const String DMAP_CODE_COM_APPLE_ITUNES_DRM_KEY1_ID = "aeK1";
const String DMAP_CODE_COM_APPLE_ITUNES_DRM_KEY2_ID = "aeK2";
const String DMAP_CODE_COM_APPLE_ITUNES_EXTENDED_MEDIA_KIND = "aeMk";
const String DMAP_CODE_COM_APPLE_ITUNES_MEDIAKIND = "aeMK";
const String DMAP_CODE_COM_APPLE_ITUNES_NON_DRM_USER_ID = "aeND";
const String DMAP_CODE_COM_APPLE_ITUNES_NETWORK_NAME = "aeNN";
const String DMAP_CODE_COM_APPLE_ITUNES_NORM_VOLUME = "aeNV";
const String DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST = "aePC";
const String DMAP_CODE_COM_APPLE_ITUNES_ITMS_PLAYLISTID = "aePI";
const String DMAP_CODE_COM_APPLE_ITUNES_IS_PODCAST_PLAYLIST = "aePP";
const String DMAP_CODE_COM_APPLE_ITUNES_SPECIAL_PLAYLIST = "aePS";
const String DMAP_CODE_COM_APPLE_ITUNES_ITMS_STOREFRONTID = "aeSF";
const String DMAP_CODE_COM_APPLE_ITUNES_SAVED_GENIUS = "aeSG";
const String DMAP_CODE_COM_APPLE_ITUNES_ITMS_SONGID = "aeSI";
const String DMAP_CODE_COM_APPLE_ITUNES_SERIES_NAME = "aeSN";
const String DMAP_CODE_COM_APPLE_ITUNES_SMART_PLAYLIST = "aeSP";
const String DMAP_CODE_COM_APPLE_ITUNES_SEASON_NUM = "aeSU";
const String DMAP_CODE_COM_APPLE_ITUNES_MUSIC_SHARING_VERSION = "aeSV";
const String DMAP_CODE_DAAP_SONGGROUPING = "agrp";
const String DMAP_CODE_DAAP_DATABASEPLAYLISTS = "aply";
const String DMAP_CODE_DAAP_PLAYLISTREPEATMODE = "aprm";
const String DMAP_CODE_DAAP_PROTOCOLVERSION = "apro";
const String DMAP_CODE_DAAP_PLAYLISTSHUFFLEMODE = "apsm";
const String DMAP_CODE_DAAP_PLAYLISTSONGS = "apso";
const String DMAP_CODE_DAAP_RESOLVEINFO = "arif";
const String DMAP_CODE_DAAP_RESOLVE = "arsv";
const String DMAP_CODE_DAAP_SONGALBUMARTIST = "asaa";
const String DMAP_CODE_DAAP_SONGALBUMID = "asai";
const String DMAP_CODE_DAAP_SONGALBUM = "asal";
const String DMAP_CODE_DAAP_SONGARTIST = "asar";
const String DMAP_CODE_DAAP_BOOKMARKABLE = "asbk";
const String DMAP_CODE_DAAP_SONGBOOKMARK = "asbo";
const String DMAP_CODE_DAAP_SONGBITRATE = "asbr";
const String DMAP_CODE_DAAP_SONGBEATSPERMINUTE = "asbt";
const String DMAP_CODE_DAAP_SONGCODECTYPE = "ascd";
const String DMAP_CODE_DAAP_SONGCOMMENT = "ascm";
const String DMAP_CODE_DAAP_SONGCONTENTDESCRIPTION = "ascn";
const String DMAP_CODE_DAAP_SONGCOMPILATION = "asco";
const String DMAP_CODE_DAAP_SONGCOMPOSER = "ascp";
const String DMAP_CODE_DAAP_SONGCONTENTRATING = "ascr";
const String DMAP_CODE_DAAP_SONGCODECSUBTYPE = "ascs";
const String DMAP_CODE_DAAP_SONGCATEGORY = "asct";
const String DMAP_CODE_DAAP_SONGDATEADDED = "asda";
const String DMAP_CODE_DAAP_SONGDISABLED = "asdb";
const String DMAP_CODE_DAAP_SONGDISCCOUNT = "asdc";
const String DMAP_CODE_DAAP_SONGDATAKIND = "asdk";
const String DMAP_CODE_DAAP_SONGDATEMODIFIED = "asdm";
const String DMAP_CODE_DAAP_SONGDISCKNUMBER = "asdn";
const String DMAP_CODE_DAAP_SONGDATEPURCHASED = "asdp";
const String DMAP_CODE_DAAP_SONGDATERELEASED = "asdr";
const String DMAP_CODE_DAAP_SONGDESCRIPTION = "asdt";
const String DMAP_CODE_DAAP_SONGEXTRADATA = "ased";
const String DMAP_CODE_DAAP_SONGEQPRESET = "aseq";
const String DMAP_CODE_DAAP_SONGFORMAT = "asfm";
const String DMAP_CODE_DAAP_SONGGENRE = "asgn";
const String DMAP_CODE_DAAP_SONGGAPLESS = "asgp";
const String DMAP_CODE_DAAP_SONGHASBEENPLAYED = "ashp";
const String DMAP_CODE_DAAP_SONGKEYWORDS = "asky";
const String DMAP_CODE_DAAP_SONGLONGCONTENTDESCRIPTION = "aslc";
const String DMAP_CODE_DAAP_SONGLONGSIZE = "asls";
const String DMAP_CODE_DAAP_SONGSONPODCASTURL = "aspu";
const String DMAP_CODE_DAAP_SONGRELATIVEVOLUME = "asrv";
const String DMAP_CODE_DAAP_SORTARTIST = "assa";
const String DMAP_CODE_DAAP_SORTCOMPOSER = "assc";
const String DMAP_CODE_DAAP_SORTALBUMARTIST = "assl";
const String DMAP_CODE_DAAP_SORTNAME = "assn";
const String DMAP_CODE_DAAP_SONGSTOPTIME = "assp";
const String DMAP_CODE_DAAP_SONGSAMPLERATE = "assr";
const String DMAP_CODE_DAAP_SONGSERIESNAME = "asss";
const String DMAP_CODE_DAAP_SONGSTARTTIME = "asst";
const String DMAP_CODE_DAAP_SORTALBUM = "assu";
const String DMAP_CODE_DAAP_SONGSIZE = "assz";
const String DMAP_CODE_DAAP_SONGTRACKCOUNT = "astc";
const String DMAP_CODE_DAAP_SONGTIME = "astm";
const String DMAP_CODE_DAAP_SONGTRACKNUMBER = "astn";
const String DMAP_CODE_DAAP_SONGDATAURL = "asul";
const String DMAP_CODE_DAAP_SONGUSERRATING = "asur";
const String DMAP_CODE_DAAP_SONGYEAR = "asyr";
const String DMAP_CODE_DAAP_SUPPORTSEXTRADATA = "ated";
const String DMAP_CODE_DAAP_SERVERDATABASES = "avdb";
const String DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_CLIENT_VOTE = "ceJC";
const String DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_CURRENT = "ceJI";
const String DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_VOTE = "ceJV";
const String DMAP_CODE_DMAP_HASCHILDCONTAINERS = "f?ch";
const String DMAP_CODE_DMAP_BAG = "mbcl";
const String DMAP_CODE_DMAP_CONTENTCODESRESPONSE = "mccr";
const String DMAP_CODE_DMAP_CONTENTCODESNAME = "mcna";
const String DMAP_CODE_DMAP_CONTENTCODESNUMBER = "mcnm";
const String DMAP_CODE_DMAP_CONTAINER = "mcon";
const String DMAP_CODE_DMAP_CONTAINERCOUNT = "mctc";
const String DMAP_CODE_DMAP_CONTAINERITEMID = "mcti";
const String DMAP_CODE_DMAP_CONTENTCODESTYPE = "mcty";
const String DMAP_CODE_DMAP_DICTIONARY = "mdcl";
const String DMAP_CODE_DMAP_EDITCOMMANDSUPPORTED = "meds";
const String DMAP_CODE_DMAP_ITEMID = "miid";
const String DMAP_CODE_DMAP_ITEMKIND = "mikd";
const String DMAP_CODE_DMAP_ITEMCOUNT = "mimc";
const String DMAP_CODE_DMAP_ITEMNAME = "minm";
const String DMAP_CODE_DMAP_LISTING = "mlcl";
const String DMAP_CODE_DMAP_SESSIONID = "mlid";
const String DMAP_CODE_DMAP_LISTINGITEM = "mlit";
const String DMAP_CODE_DMAP_LOGINRESPONSE = "mlog";
const String DMAP_CODE_DMAP_PARENTCONTAINERID = "mpco";
const String DMAP_CODE_DMAP_PERSISTENTID = "mper";
const String DMAP_CODE_DMAP_PROTOCOLVERSION = "mpro";
const String DMAP_CODE_DMAP_RETURNEDCOUNT = "mrco";
const String DMAP_CODE_DMAP_SUPPORTSAUTOLOGOUT = "msal";
const String DMAP_CODE_DMAP_AUTHENTICATIONSCHEMES = "msas";
const String DMAP_CODE_DMAP_AUTHENTICATIONMETHOD = "msau";
const String DMAP_CODE_DMAP_SUPPORTSBROWSE = "msbr";
const String DMAP_CODE_DMAP_DATABASESCOUNT = "msdc";
const String DMAP_CODE_DMAP_SUPPORTSEXTENSIONS = "msex";
const String DMAP_CODE_DMAP_SUPPORTSINDEX = "msix";
const String DMAP_CODE_DMAP_LOGINREQUIRED = "mslr";
const String DMAP_CODE_DMAP_SUPPORTSPERSISTENTIDS = "mspi";
const String DMAP_CODE_DMAP_SUPPORTSQUERY = "msqy";
const String DMAP_CODE_DMAP_SUPPORTSRESOLVE = "msrs";
const String DMAP_CODE_DMAP_SERVERINFORESPONSE = "msrv";
const String DMAP_CODE_DMAP_UTCTIME = "mstc";
const String DMAP_CODE_DMAP_TIMEOUTINTERVAL = "mstm";
const String DMAP_CODE_DMAP_UTCOFFSET = "msto";
const String DMAP_CODE_DMAP_STATUSSTRING = "msts";
const String DMAP_CODE_DMAP_STATUS = "mstt";
const String DMAP_CODE_DMAP_SUPPORTSUPDATE = "msup";
const String DMAP_CODE_DMAP_SPECIFIEDTOTALCOUNT = "mtco";
const String DMAP_CODE_DMAP_DELETEDIDLISTING = "mudl";
const String DMAP_CODE_DMAP_UPDATERESPONSE = "mupd";
const String DMAP_CODE_DMAP_SERVERREVISION = "musr";
const String DMAP_CODE_DMAP_UPDATETYPE = "muty";
const String DMAP_CODE_DPAP_PROTOCOLVERSION = "ppro";
const String DMAP_CODE_DPAP_UNKNOWN = "pret";

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
  DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_CLIENT_VOTE: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_CLIENT_VOTE,
      "com.apple.itunes.jukebox-client-vote",
      unsignedByte),
  DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_CURRENT: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_CURRENT,
      "com.apple.itunes.jukebox-current",
      integer),
  DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_VOTE: DmapCode(
      DMAP_CODE_COM_APPLE_ITUNE_JUKEBOX_VOTE,
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

/// URLs
const String contentCodesUrlPath = "content-codes";
const String databasesUrlPath = "databases";
const String databaseUrlPath = "databases/{databaseId}/items";
const String loginUrlPath = "login";
const String playlistsUrlPath = "databases/{databaseId}/containers";
const String playlistUrlPath =
    "databases/{databaseId}/containers/{playlistId}/items";
const String serverInfoUrlPath = "server-info";
const String updateUrlPath = "update";

/// Queries meta's defaults
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
];
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
];
