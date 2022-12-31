import 'dart:convert' show jsonEncode;
import 'package:http/http.dart' show Response;

/// List of Image endpoints
// ignore: constant_identifier_names
const IMAGE_CATEGORIES = ["kitsune", "neko", "husbando", "waifu"];

/// List of GIF endpoints
// ignore: constant_identifier_names
const GIF_CATEGORIES = [
  "baka",
  "bite",
  "blush",
  "bored",
  "cry",
  "cuddle",
  "dance",
  "facepalm",
  "feed",
  "happy",
  "highfive",
  "hug",
  "kiss",
  "laugh",
  "pat",
  "pout",
  "shrug",
  "slap",
  "sleep",
  "smile",
  "smug",
  "stare",
  "think",
  "thumbsup",
  "tickle",
  "wave",
  "wink",
  "kick",
  "handhold",
  "punch",
  "shoot",
  "yeet",
  "poke",
  "nod",
  "nom",
  "nope"
];

final CATEGORIES = List.from(IMAGE_CATEGORIES)..addAll(GIF_CATEGORIES);

class NBResponse {
  late final String url;
  late final String? artist_href;
  late final String? artist_name;
  late final String? source_url;
  late final String? anime_name;
  NBResponse(Map<String, dynamic> nb) {
    // The type coercion is necessary as maps return String?
    // which cannot be assigned to type String. Url is always
    // present in both static and gif response
    url = nb['url'] as String;
    artist_href = nb['artist_href'];
    artist_name = nb['artist_name'];
    source_url = nb['source_url'];
    anime_name = nb['anime_name'];
  }

  // This makes life easier for me to debug shit.
  @override
  String toString() {
    var res = {'url': url};
    if (artist_href is String) {
      res['artist_href'] = artist_href as String;
    }
    if (artist_name is String) {
      res['artist_name'] = artist_name as String;
    }
    if (source_url is String) {
      res['source_url'] = source_url as String;
    }
    if (anime_name is String) {
      res['anime_name'] = anime_name as String;
    }
    return jsonEncode(res);
  }
}

class NBBufferResponse {
  late final List<int> data;
  late final String? artist_href;
  late final String? artist_name;
  late final String? source_url;
  late final String? anime_name;
  NBBufferResponse(Response res) {
    artist_href = res.headers['artist_href'];
    artist_name = res.headers['artist_name'];
    source_url = res.headers['source_url'];
    anime_name = res.headers['anime_name'];
    data = res.bodyBytes;
  }

  @override
  String toString() {
    var res = {'data': '[Instance of List<Int>]'};
    if (artist_href is String) {
      res['artist_href'] = Uri.decodeComponent(artist_href as String);
    }
    if (artist_name is String) {
      res['artist_name'] = Uri.decodeComponent(artist_name as String);
    }
    if (source_url is String) {
      res['source_url'] = Uri.decodeComponent(source_url as String);
    }
    if (anime_name is String) {
      res['anime_name'] = Uri.decodeComponent(anime_name as String);
    }
    return jsonEncode(res);
  }
}

/// Empty class for any sort of error
abstract class NBError {}

class NBRateLimitError extends NBError {
  late final int remaining;
  late final DateTime resetsIn;

  NBRateLimitError(rem, reset) {
    remaining = int.parse(rem);
    resetsIn = DateTime.parse(reset);
  }

  @override
  String toString() {
    return 'Rate Limit error. Remaining $remaining. Resets in $resetsIn';
  }
}

class NBArgumentError extends NBError {
  late final String error;
  NBArgumentError(this.error);

  @override
  String toString() {
    return error;
  }
}
