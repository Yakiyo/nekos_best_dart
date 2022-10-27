import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NBResonse {
  late final String url;
  late final String? artist_href;
  late final String? artist_name;
  late final String? source_url;
  late final String? anime_name;
  NBResonse(Map<String, dynamic> nb) {
    // The type coercion is necessary as maps return String?
    // which cannot be assigned to type String. Url is always
    // present in both static and gif response
    url = nb['url'] as String;
    artist_href = nb['artist_href'];
    artist_name = nb['artist_name'];
    source_url = nb['source_url'];
    anime_name = nb['anime_name'];
  }
}

/// List of all the endpoints
// ignore: constant_identifier_names
const CATEGORIES = [
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
  "kitsune",
  "laugh",
  "neko",
  "pat",
  "poke",
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
  "waifu",
  "kick",
  "handhold",
  "punch",
  "shoot",
  "husbando",
  "yeet"
];

/// Make a request to nekos.best. Private function for internal use only
Future<Map<String, dynamic>> request(String path) async {
  var url = Uri.parse('https://nekos.best/api/v2/$path');
  var res =
      await http.get(url, headers: {"User-Agent": "nekos_best.dart / 1.0.0"});

  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body) as Map<String, dynamic>;
  } else {
    throw 'Error when requesting content from api. Got status code ${res.statusCode}';
  }
}
