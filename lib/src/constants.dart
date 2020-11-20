// daap-client
// lib/src/constants.dart

import "objects.dart";

/// DMAP data types.
const int byte = 1;
const int unsignedByte = 2;
const int short = 3;
const int unsignedShort = 4;
const int integer = 5;
const int unsignedInteger = 6;
const int long = 7;
const int unsignedLong = 8;
const int string = 9;
const int timestamp = 10;
const int version = 11;
const int container = 12;

/// DMAP data types mapping (according to protocol).
const Map<int, String> dmapDataTypes = {
  byte: "b",
  unsignedByte: "ub",
  short: "h",
  unsignedShort: "uh",
  integer: "i",
  unsignedInteger: "ui",
  long: "l",
  unsignedLong: "ul",
  string: "s",
  timestamp: "t",
  version: "v",
  container: "c",
};

/// DMAP data types mapping (human readable).
const Map<int, String> dmapDataTypesNames = {
  byte: "byte", // Int8
  unsignedByte: "unsigned byte", // Uint8
  short: "short", // Int16
  unsignedShort: "unsigned short", // Uint16
  integer: "integer", // Int32
  unsignedInteger: "unsigned integer", // Int32
  long: "long", // Int64
  unsignedLong: "unsigned long", // Uint64
  string: "string", // String
  timestamp: "timestamp", // double
  version: "version", // Uint32
  container: "container",
};

/// DMAP code types mapping.
final Map<String, DmapCode> dmapCodeTypes = {
  "abal": DmapCode("abal", "daap.browsealbumlisting", container),
  "abar": DmapCode("abar", "daap.browseartistlisting", container),
  "abcp": DmapCode("abcp", "daap.browsecomposerlisting", container),
  "abgn": DmapCode("abgn", "daap.browsegenrelisting", container),
  "abpl": DmapCode("abpl", "daap.baseplaylist", byte),
  "abro": DmapCode("abro", "daap.databasebrowse", container),
  "adbs": DmapCode("adbs", "daap.databasesongs", container),
  "aeAI": DmapCode("aeAI", "com.apple.itunes.itms-artistid", integer),
  "aeCI": DmapCode("aeCI", "com.apple.itunes.itms-composerid", integer),
  "aeEN": DmapCode("aeEN", "com.apple.itunes.episode-num-str", string),
  "aeES": DmapCode("aeES", "com.apple.itunes.episode-sort", integer),
  "aeFP": DmapCode("aeFP", "com.apple.itunes.req-fplay", byte),
  "aeGU": DmapCode("aeGU", "com.apple.itunes.gapless-dur", long),
  "aeGD": DmapCode("aeGD", "com.apple.itunes.gapless-enc-dr", integer),
  "aeGE": DmapCode("aeGE", "com.apple.itunes.gapless-enc-del", integer),
  "aeGH": DmapCode("aeGH", "com.apple.itunes.gapless-heur", integer),
  "aeGI": DmapCode("aeGI", "com.apple.itunes.itms-genreid", integer),
  "aeGR": DmapCode("aeGR", "com.apple.itunes.gapless-resy", long),
  "aeHV": DmapCode("aeHV", "com.apple.itunes.has-video", byte),
  "aeMK": DmapCode("aeMK", "com.apple.itunes.mediakind", byte),
  "aeNN": DmapCode("aeNN", "com.apple.itunes.network-name", string),
  "aeNV": DmapCode("aeNV", "com.apple.itunes.norm-volume", integer),
  "aePC": DmapCode("aePC", "com.apple.itunes.is-podcast", byte),
  "aePI": DmapCode("aePI", "com.apple.itunes.itms-playlistid", integer),
  "aePP": DmapCode("aePP", "com.apple.itunes.is-podcast-playlist", byte),
  "aePS": DmapCode("aePS", "com.apple.itunes.special-playlist", byte),
  "aeSU": DmapCode("aeSU", "com.apple.itunes.season-num", integer),
  "aeSF": DmapCode("aeSF", "com.apple.itunes.itms-storefrontid", integer),
  "aeSI": DmapCode("aeSI", "com.apple.itunes.itms-songid", integer),
  "aeSN": DmapCode("aeSN", "com.apple.itunes.series-name", string),
  "aeSP": DmapCode("aeSP", "com.apple.itunes.smart-playlist", byte),
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
  "asrv": DmapCode("asrv", "daap.songrelativevolume", unsignedByte),
  "assu": DmapCode("assu", "daap.sortalbum", string),
  "assa": DmapCode("assa", "daap.sortartist", string),
  "assc": DmapCode("assc", "daap.sortcomposer", string),
  "assl": DmapCode("assl", "daap.sortalbumartist", string),
  "assn": DmapCode("assn", "daap.sortname", string),
  "assp": DmapCode("assp", "daap.songstoptime", integer),
  "assr": DmapCode("assr", "daap.songsamplerate", integer),
  "asss": DmapCode("asss", "daap.sortseriesname", string),
  "asst": DmapCode("asst", "daap.songstarttime", integer),
  "assz": DmapCode("assz", "daap.songsize", integer),
  "astc": DmapCode("astc", "daap.songtrackcount", short),
  "astm": DmapCode("astm", "daap.songtime", integer),
  "astn": DmapCode("astn", "daap.songtracknumber", short),
  "asul": DmapCode("asul", "daap.songdataurl", string),
  "asur": DmapCode("asur", "daap.songuserrating", byte),
  "asyr": DmapCode("asyr", "daap.songyear", short),
  "ated": DmapCode("ated", "daap.supportsextradata", short),
  "avdb": DmapCode("avdb", "daap.serverdatabases", container),
  "mbcl": DmapCode("mbcl", "dmap.bag", container),
  "mccr": DmapCode("mccr", "dmap.contentcodesresponse", container),
  "mcna": DmapCode("mcna", "dmap.contentcodesname", string),
  "mcnm": DmapCode("mcnm", "dmap.contentcodesnumber", integer),
  "mcon": DmapCode("mcon", "dmap.container", container),
  "mctc": DmapCode("mctc", "dmap.containercount", integer),
  "mcti": DmapCode("mcti", "dmap.containeritemid", integer),
  "mcty": DmapCode("mcty", "dmap.contentcodestype", short),
  "mdcl": DmapCode("mdcl", "dmap.dictionary", container),
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
  "msau": DmapCode("msau", "dmap.authenticationmethod", byte),
  "msal": DmapCode("msal", "dmap.supportsautologout", byte),
  "msas": DmapCode("msas", "dmap.authenticationschemes", integer),
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
  "User-Agent": "daapc/0.0.0 (https://github.com/vint21h/daap-client/)",
  "Accept": "application/x-dmap-tagged",
};

/// URLs
const String contentCodesUrlPath = "content-codes";
const String loginUrlPath = "login";
const String serverInfoUrlPath = "server-info";
