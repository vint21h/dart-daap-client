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

// TODO: create codes constants.
/// DMAP code types mapping.
final Map<String, DmapCode> dmapCodeTypes = {
  "????": DmapCode("????", "com.apple.itunes.req-fplay", byte),
  "abal": DmapCode("abal", "daap.browsealbumlisting", container),
  "abar": DmapCode("abar", "daap.browseartistlisting", container),
  "abcp": DmapCode("abcp", "daap.browsecomposerlisting", container),
  "abgn": DmapCode("abgn", "daap.browsegenrelisting", container),
  "abpl": DmapCode("abpl", "daap.baseplaylist", byte),
  "abro": DmapCode("abro", "daap.databasebrowse", container),
  "adbs": DmapCode("adbs", "daap.databasesongs", container),
  "aeAD": DmapCode("aeAD", "com.apple.itunes.adam-ids-array", container),
  "aeAI": DmapCode("aeAI", "com.apple.itunes.itms-artistid", integer),
  "aeCI": DmapCode("aeCI", "com.apple.itunes.itms-composerid", integer),
  "aeCR": DmapCode("aeCR", "com.apple.itunes.content-rating", string),
  "aeDP": DmapCode("aeDP", "com.apple.itunes.drm-platform-id", integer),
  "aeDR": DmapCode("aeDR", "com.apple.itunes.drm-user-id", long),
  "aeDV": DmapCode("aeDV", "com.apple.itunes.drm-versions", integer),
  "aeEN": DmapCode("aeEN", "com.apple.itunes.episode-num-str", string),
  "aeES": DmapCode("aeES", "com.apple.itunes.episode-sort", integer),
  "aeFP": DmapCode("aeFP", "com.apple.itunes.req-fplay", byte),
  "aeGD": DmapCode("aeGD", "com.apple.itunes.gapless-enc-dr", integer),
  "aeGE": DmapCode("aeGE", "com.apple.itunes.gapless-enc-del", integer),
  "aeGH": DmapCode("aeGH", "com.apple.itunes.gapless-heur", integer),
  "aeGI": DmapCode("aeGI", "com.apple.itunes.itms-genreid", integer),
  "aeGR": DmapCode("aeGR", "com.apple.itunes.gapless-resy", long),
  "aeGU": DmapCode("aeGU", "com.apple.itunes.gapless-dur", long),
  "aeHD": DmapCode("aeHD", "com.apple.itunes.is-hd-video", byte),
  "aeHV": DmapCode("aeHV", "com.apple.itunes.has-video", byte),
  "aeK1": DmapCode("aeK1", "com.apple.itunes.drm-key1-id", long),
  "aeK2": DmapCode("aeK2", "com.apple.itunes.drm-key2-id", long),
  "aeMk": DmapCode("aeMk", "com.apple.itunes.extended-media-kind", integer),
  "aeMK": DmapCode("aeMK", "com.apple.itunes.mediakind", byte),
  "aeND": DmapCode("aeND", "com.apple.itunes.non-drm-user-id", long),
  "aeNN": DmapCode("aeNN", "com.apple.itunes.network-name", string),
  "aeNV": DmapCode("aeNV", "com.apple.itunes.norm-volume", integer),
  "aePC": DmapCode("aePC", "com.apple.itunes.is-podcast", byte),
  "aePI": DmapCode("aePI", "com.apple.itunes.itms-playlistid", integer),
  "aePP": DmapCode("aePP", "com.apple.itunes.is-podcast-playlist", byte),
  "aePS": DmapCode("aePS", "com.apple.itunes.special-playlist", byte),
  "aeSF": DmapCode("aeSF", "com.apple.itunes.itms-storefrontid", integer),
  "aeSG": DmapCode("aeSG", "com.apple.itunes.saved-genius", byte),
  "aeSI": DmapCode("aeSI", "com.apple.itunes.itms-songid", integer),
  "aeSN": DmapCode("aeSN", "com.apple.itunes.series-name", string),
  "aeSP": DmapCode("aeSP", "com.apple.itunes.smart-playlist", byte),
  "aeSU": DmapCode("aeSU", "com.apple.itunes.season-num", integer),
  "aeSV": DmapCode("aeSV", "com.apple.itunes.music-sharing-version", integer),
  "agrp": DmapCode("agrp", "daap.songgrouping", string),
  "aply": DmapCode("aply", "daap.databaseplaylists", container),
  "aprm": DmapCode("aprm", "daap.playlistrepeatmode", byte),
  "apro": DmapCode("apro", "daap.protocolversion", version),
  "apsm": DmapCode("apsm", "daap.playlistshufflemode", byte),
  "apso": DmapCode("apso", "daap.playlistsongs", container),
  "arif": DmapCode("arif", "daap.resolveinfo", container),
  "arsv": DmapCode("arsv", "daap.resolve", container),
  "asaa": DmapCode("asaa", "daap.songalbumartist", string),
  "asai": DmapCode("asai", "daap.songalbumid", long),
  "asal": DmapCode("asal", "daap.songalbum", string),
  "asar": DmapCode("asar", "daap.songartist", string),
  "asbk": DmapCode("asbk", "daap.bookmarkable", byte),
  "asbo": DmapCode("asbo", "daap.songbookmark", integer),
  "asbr": DmapCode("asbr", "daap.songbitrate", short),
  "asbt": DmapCode("asbt", "daap.songbeatsperminute", short),
  "ascd": DmapCode("ascd", "daap.songcodectype", integer),
  "ascm": DmapCode("ascm", "daap.songcomment", string),
  "ascn": DmapCode("ascn", "daap.songcontentdescription", string),
  "asco": DmapCode("asco", "daap.songcompilation", byte),
  "ascp": DmapCode("ascp", "daap.songcomposer", string),
  "ascr": DmapCode("ascr", "daap.songcontentrating", byte),
  "ascs": DmapCode("ascs", "daap.songcodecsubtype", integer),
  "asct": DmapCode("asct", "daap.songcategory", string),
  "asda": DmapCode("asda", "daap.songdateadded", timestamp),
  "asdb": DmapCode("asdb", "daap.songdisabled", byte),
  "asdc": DmapCode("asdc", "daap.songdisccount", short),
  "asdk": DmapCode("asdk", "daap.songdatakind", byte),
  "asdm": DmapCode("asdm", "daap.songdatemodified", timestamp),
  "asdn": DmapCode("asdn", "daap.songdiscnumber", short),
  "asdp": DmapCode("asdp", "daap.songdatepurchased", timestamp),
  "asdr": DmapCode("asdr", "daap.songdatereleased", timestamp),
  "asdt": DmapCode("asdt", "daap.songdescription", string),
  "ased": DmapCode("ased", "daap.songextradata", short),
  "aseq": DmapCode("aseq", "daap.songeqpreset", string),
  "asfm": DmapCode("asfm", "daap.songformat", string),
  "asgn": DmapCode("asgn", "daap.songgenre", string),
  "asgp": DmapCode("asgp", "daap.songgapless", byte),
  "ashp": DmapCode("ashp", "daap.songhasbeenplayed", byte),
  "asky": DmapCode("asky", "daap.songkeywords", string),
  "aslc": DmapCode("aslc", "daap.songlongcontentdescription", string),
  "asls": DmapCode("asls", "daap.songlongsize", string),
  "aspu": DmapCode("aspu", "daap.songsonpodcasturl", string),
  "asrv": DmapCode("asrv", "daap.songrelativevolume", unsignedByte),
  "assa": DmapCode("assa", "daap.sortartist", string),
  "assc": DmapCode("assc", "daap.sortcomposer", string),
  "assl": DmapCode("assl", "daap.sortalbumartist", string),
  "assn": DmapCode("assn", "daap.sortname", string),
  "assp": DmapCode("assp", "daap.songstoptime", integer),
  "assr": DmapCode("assr", "daap.songsamplerate", integer),
  "asss": DmapCode("asss", "daap.sortseriesname", string),
  "asst": DmapCode("asst", "daap.songstarttime", integer),
  "assu": DmapCode("assu", "daap.sortalbum", string),
  "assz": DmapCode("assz", "daap.songsize", integer),
  "astc": DmapCode("astc", "daap.songtrackcount", short),
  "astm": DmapCode("astm", "daap.songtime", integer),
  "astn": DmapCode("astn", "daap.songtracknumber", short),
  "asul": DmapCode("asul", "daap.songdataurl", string),
  "asur": DmapCode("asur", "daap.songuserrating", byte),
  "asyr": DmapCode("asyr", "daap.songyear", short),
  "ated": DmapCode("ated", "daap.supportsextradata", short),
  "avdb": DmapCode("avdb", "daap.serverdatabases", container),
  "ceJC":
      DmapCode("ceJC", "com.apple.itunes.jukebox-client-vote", unsignedByte),
  "ceJI": DmapCode("ceJI", "com.apple.itunes.jukebox-current", integer),
  "ceJV": DmapCode("ceJV", "com.apple.itunes.jukebox-vote", integer),
  "f?ch": DmapCode("f?ch", "dmap.haschildcontainers", byte),
  "mbcl": DmapCode("mbcl", "dmap.bag", container),
  "mccr": DmapCode("mccr", "dmap.contentcodesresponse", container),
  "mcna": DmapCode("mcna", "dmap.contentcodesname", string),
  "mcnm": DmapCode("mcnm", "dmap.contentcodesnumber", integer),
  "mcon": DmapCode("mcon", "dmap.container", container),
  "mctc": DmapCode("mctc", "dmap.containercount", integer),
  "mcti": DmapCode("mcti", "dmap.containeritemid", integer),
  "mcty": DmapCode("mcty", "dmap.contentcodestype", short),
  "mdcl": DmapCode("mdcl", "dmap.dictionary", container),
  "meds": DmapCode("meds", "dmap.editcommandssupported", long),
  "miid": DmapCode("miid", "dmap.itemid", integer),
  "mikd": DmapCode("mikd", "dmap.itemkind", byte),
  "mimc": DmapCode("mimc", "dmap.itemcount", integer),
  "minm": DmapCode("minm", "dmap.itemname", string),
  "mlcl": DmapCode("mlcl", "dmap.listing", container),
  "mlid": DmapCode("mlid", "dmap.sessionid", integer),
  "mlit": DmapCode("mlit", "dmap.listingitem", container),
  "mlog": DmapCode("mlog", "dmap.loginresponse", container),
  "mpco": DmapCode("mpco", "dmap.parentcontainerid", integer),
  "mper": DmapCode("mper", "dmap.persistentid", long),
  "mpro": DmapCode("mpro", "dmap.protocolversion", version),
  "mrco": DmapCode("mrco", "dmap.returnedcount", integer),
  "msal": DmapCode("msal", "dmap.supportsautologout", byte),
  "msas": DmapCode("msas", "dmap.authenticationschemes", integer),
  "msau": DmapCode("msau", "dmap.authenticationmethod", byte),
  "msbr": DmapCode("msbr", "dmap.supportsbrowse", byte),
  "msdc": DmapCode("msdc", "dmap.databasescount", integer),
  "msex": DmapCode("msex", "dmap.supportsextensions", byte),
  "msix": DmapCode("msix", "dmap.supportsindex", byte),
  "mslr": DmapCode("mslr", "dmap.loginrequired", byte),
  "mspi": DmapCode("mspi", "dmap.supportspersistentids", byte),
  "msqy": DmapCode("msqy", "dmap.supportsquery", byte),
  "msrs": DmapCode("msrs", "dmap.supportsresolve", byte),
  "msrv": DmapCode("msrv", "dmap.serverinforesponse", container),
  "mstc": DmapCode("mstc", "dmap.utctime", timestamp),
  "mstm": DmapCode("mstm", "dmap.timeoutinterval", integer),
  "msto": DmapCode("msto", "dmap.utcoffset", unsignedInteger),
  "msts": DmapCode("msts", "dmap.statusstring", string),
  "mstt": DmapCode("mstt", "dmap.status", integer),
  "msup": DmapCode("msup", "dmap.supportsupdate", byte),
  "mtco": DmapCode("mtco", "dmap.specifiedtotalcount", integer),
  "mudl": DmapCode("mudl", "dmap.deletedidlisting", container),
  "mupd": DmapCode("mupd", "dmap.updateresponse", container),
  "musr": DmapCode("musr", "dmap.serverrevision", integer),
  "muty": DmapCode("muty", "dmap.updatetype", byte),
  "ppro": DmapCode("ppro", "dpap.protocolversion", integer),
  "pret": DmapCode("pret", "dpap.unknown", container),
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
  "aeNV",
  "asaa",
  "asar",
  "asbr",
  "asbt",
  "ascm",
  "asco",
  "ascp",
  "asda",
  "asdb",
  "asdc",
  "asdk",
  "asdm",
  "asdn",
  "asdt",
  "aseq",
  "asfm",
  "asgn",
  "asrv",
  "assp",
  "assr",
  "asst",
  "assz",
  "astc",
  "astm",
  "astn",
  "asul",
  "asur",
  "asyr",
  "miid",
  "mikd",
  "minm",
  "mper",
];
const List<String> playlistsQueryDefaultMetaCodes = [
  "abpl",
  "aePP",
  "aePS",
  "aeSG",
  "aeSP",
  "f?ch",
  "miid",
  "mimc",
  "minm",
  "mlit",
  "mpco",
  "mper",
];
const List<String> playlistQueryDefaultMetaCodes = [
  "asaa",
  "asar",
  "asfm",
  "asgn",
  "assz",
  "astm",
  "astn",
  "asyr",
  "mcti",
  "miid",
  "mikd",
  "minm",
];
