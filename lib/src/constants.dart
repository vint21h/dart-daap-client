// daap-client
// lib/src/constants.dart

import "objects.dart";

/// DMAP data types.
final int byte = 1;
final int unsignedByte = 2;
final int short = 3;
final int unsignedShort = 4;
final int integer = 5;
final int unsignedInteger = 6;
final int long = 7;
final int unsignedLong = 8;
final int string = 9;
final int timestamp = 10;
final int version = 11;
final int container = 12;

/// DMAP data types mapping.
final Map<int, String> dmapDataTypes = {
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

/// DMAP code types mapping.
final Map dmapCodeTypes = {
  "abal": DmapCode("daap.browsealbumlisting", container),
  "abar": DmapCode("daap.browseartistlisting", container),
  "abcp": DmapCode("daap.browsecomposerlisting", container),
  "abgn": DmapCode("daap.browsegenrelisting", container),
  "abpl": DmapCode("daap.baseplaylist", byte),
  "abro": DmapCode("daap.databasebrowse", container),
  "adbs": DmapCode("daap.databasesongs", container),
  "aeAI": DmapCode("com.apple.itunes.itms-artistid", integer),
  "aeCI": DmapCode("com.apple.itunes.itms-composerid", integer),
  "aeEN": DmapCode("com.apple.itunes.episode-num-str", string),
  "aeES": DmapCode("com.apple.itunes.episode-sort", integer),
  "aeFP": DmapCode("com.apple.itunes.req-fplay", byte),
  "aeGU": DmapCode("com.apple.itunes.gapless-dur", long),
  "aeGD": DmapCode("com.apple.itunes.gapless-enc-dr", integer),
  "aeGE": DmapCode("com.apple.itunes.gapless-enc-del", integer),
  "aeGH": DmapCode("com.apple.itunes.gapless-heur", integer),
  "aeGI": DmapCode("com.apple.itunes.itms-genreid", integer),
  "aeGR": DmapCode("com.apple.itunes.gapless-resy", long),
  "aeHV": DmapCode("com.apple.itunes.has-video", byte),
  "aeMK": DmapCode("com.apple.itunes.mediakind", byte),
  "aeNN": DmapCode("com.apple.itunes.network-name", string),
  "aeNV": DmapCode("com.apple.itunes.norm-volume", integer),
  "aePC": DmapCode("com.apple.itunes.is-podcast", byte),
  "aePI": DmapCode("com.apple.itunes.itms-playlistid", integer),
  "aePP": DmapCode("com.apple.itunes.is-podcast-playlist", byte),
  "aePS": DmapCode("com.apple.itunes.special-playlist", byte),
  "aeSU": DmapCode("com.apple.itunes.season-num", integer),
  "aeSF": DmapCode("com.apple.itunes.itms-storefrontid", integer),
  "aeSI": DmapCode("com.apple.itunes.itms-songid", integer),
  "aeSN": DmapCode("com.apple.itunes.series-name", string),
  "aeSP": DmapCode("com.apple.itunes.smart-playlist", byte),
  "aeSV": DmapCode("com.apple.itunes.music-sharing-version", integer),
  "agrp": DmapCode("daap.songgrouping", string),
  "aply": DmapCode("daap.databaseplaylists", container),
  "aprm": DmapCode("daap.playlistrepeatmode", byte),
  "apro": DmapCode("daap.protocolversion", version),
  "apsm": DmapCode("daap.playlistshufflemode", byte),
  "apso": DmapCode("daap.playlistsongs", container),
  "arif": DmapCode("daap.resolveinfo", container),
  "arsv": DmapCode("daap.resolve", container),
  "asaa": DmapCode("daap.songalbumartist", string),
  "asal": DmapCode("daap.songalbum", string),
  "asar": DmapCode("daap.songartist", string),
  "asbk": DmapCode("daap.bookmarkable", byte),
  "asbo": DmapCode("daap.songbookmark", integer),
  "asbr": DmapCode("daap.songbitrate", short),
  "asbt": DmapCode("daap.songbeatsperminute", short),
  "ascd": DmapCode("daap.songcodectype", integer),
  "ascm": DmapCode("daap.songcomment", string),
  "ascn": DmapCode("daap.songcontentdescription", string),
  "asco": DmapCode("daap.songcompilation", byte),
  "ascp": DmapCode("daap.songcomposer", string),
  "ascr": DmapCode("daap.songcontentrating", byte),
  "ascs": DmapCode("daap.songcodecsubtype", integer),
  "asct": DmapCode("daap.songcategory", string),
  "asda": DmapCode("daap.songdateadded", timestamp),
  "asdb": DmapCode("daap.songdisabled", byte),
  "asdc": DmapCode("daap.songdisccount", short),
  "asdk": DmapCode("daap.songdatakind", byte),
  "asdm": DmapCode("daap.songdatemodified", timestamp),
  "asdn": DmapCode("daap.songdiscnumber", short),
  "asdp": DmapCode("daap.songdatepurchased", timestamp),
  "asdr": DmapCode("daap.songdatereleased", timestamp),
  "asdt": DmapCode("daap.songdescription", string),
  "ased": DmapCode("daap.songextradata", short),
  "aseq": DmapCode("daap.songeqpreset", string),
  "asfm": DmapCode("daap.songformat", string),
  "asgn": DmapCode("daap.songgenre", string),
  "asgp": DmapCode("daap.songgapless", byte),
  "ashp": DmapCode("daap.songhasbeenplayed", byte),
  "asky": DmapCode("daap.songkeywords", string),
  "aslc": DmapCode("daap.songlongcontentdescription", string),
  "asrv": DmapCode("daap.songrelativevolume", unsignedByte),
  "assu": DmapCode("daap.sortalbum", string),
  "assa": DmapCode("daap.sortartist", string),
  "assc": DmapCode("daap.sortcomposer", string),
  "assl": DmapCode("daap.sortalbumartist", string),
  "assn": DmapCode("daap.sortname", string),
  "assp": DmapCode("daap.songstoptime", integer),
  "assr": DmapCode("daap.songsamplerate", integer),
  "asss": DmapCode("daap.sortseriesname", string),
  "asst": DmapCode("daap.songstarttime", integer),
  "assz": DmapCode("daap.songsize", integer),
  "astc": DmapCode("daap.songtrackcount", short),
  "astm": DmapCode("daap.songtime", integer),
  "astn": DmapCode("daap.songtracknumber", short),
  "asul": DmapCode("daap.songdataurl", string),
  "asur": DmapCode("daap.songuserrating", byte),
  "asyr": DmapCode("daap.songyear", short),
  "ated": DmapCode("daap.supportsextradata", short),
  "avdb": DmapCode("daap.serverdatabases", container),
  "mbcl": DmapCode("dmap.bag", container),
  "mccr": DmapCode("dmap.contentcodesresponse", container),
  "mcna": DmapCode("dmap.contentcodesname", string),
  "mcnm": DmapCode("dmap.contentcodesnumber", integer),
  "mcon": DmapCode("dmap.container", container),
  "mctc": DmapCode("dmap.containercount", integer),
  "mcti": DmapCode("dmap.containeritemid", integer),
  "mcty": DmapCode("dmap.contentcodestype", short),
  "mdcl": DmapCode("dmap.dictionary", container),
  "miid": DmapCode("dmap.itemid", integer),
  "mikd": DmapCode("dmap.itemkind", byte),
  "mimc": DmapCode("dmap.itemcount", integer),
  "minm": DmapCode("dmap.itemname", string),
  "mlcl": DmapCode("dmap.listing", container),
  "mlid": DmapCode("dmap.sessionid", integer),
  "mlit": DmapCode("dmap.listingitem", container),
  "mlog": DmapCode("dmap.loginresponse", container),
  "mpco": DmapCode("dmap.parentcontainerid", integer),
  "mper": DmapCode("dmap.persistentid", long),
  "mpro": DmapCode("dmap.protocolversion", version),
  "mrco": DmapCode("dmap.returnedcount", integer),
  "msau": DmapCode("dmap.authenticationmethod", byte),
  "msal": DmapCode("dmap.supportsautologout", byte),
  "msas": DmapCode("dmap.authenticationschemes", integer),
  "msbr": DmapCode("dmap.supportsbrowse", byte),
  "msdc": DmapCode("dmap.databasescount", integer),
  "msex": DmapCode("dmap.supportsextensions", byte),
  "msix": DmapCode("dmap.supportsindex", byte),
  "mslr": DmapCode("dmap.loginrequired", byte),
  "mspi": DmapCode("dmap.supportspersistentids", byte),
  "msqy": DmapCode("dmap.supportsquery", byte),
  "msrs": DmapCode("dmap.supportsresolve", byte),
  "msrv": DmapCode("dmap.serverinforesponse", container),
  "mstc": DmapCode("dmap.utctime", timestamp),
  "mstm": DmapCode("dmap.timeoutinterval", integer),
  "msto": DmapCode("dmap.utcoffset", unsignedInteger),
  "msts": DmapCode("dmap.statusstring", string),
  "mstt": DmapCode("dmap.status", integer),
  "msup": DmapCode("dmap.supportsupdate", byte),
  "mtco": DmapCode("dmap.specifiedtotalcount", integer),
  "mudl": DmapCode("dmap.deletedidlisting", container),
  "mupd": DmapCode("dmap.updateresponse", container),
  "musr": DmapCode("dmap.serverrevision", integer),
  "muty": DmapCode("dmap.updatetype", byte),
  "ppro": DmapCode("dpap.protocolversion", integer),
  "pret": DmapCode("dpap.unknown", container),
};

/// HTTP request headers payload.
final Map<String, String> requestHeaders = {
  "Client-DAAP-Version": "3.0",
  "Client-DAAP-Access-Index": "2",
  "User-Agent": "daapc/0.0.0 (https://github.com/vint21h/daap-client/)",
  "Accept": "application/x-dmap-tagged",
};

/// HTTP status codes.
final int httpStatusOk = 200;
final int httpStatusUnauthorized = 401;
final int httpStatusForbidden = 403;
final int httpStatusServiceUnavailable = 503;
final int httpStatusNoContent = 204;

/// URLs
final String contentCodesUrlPath = "content-codes";
final String loginUrlPath = "login";
final String serverInfoUrlPath = "server-info";
