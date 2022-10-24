import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
    print(res.body);
    throw 'Error when requesting content from api. Got status code ${res.statusCode}';
  }
}

/// Fetch result from a optionally specified endpoint. If endpoint is not
/// specified, it picks a random one, else uses the specified endpoint.
Future<Map<String, dynamic>> fetch([String? endpoint]) async {
  endpoint ??= (CATEGORIES.toList()..shuffle()).first;
  endpoint = endpoint.toLowerCase();
  if (!CATEGORIES.contains(endpoint)) {
    throw ('$endpoint is not a valid endpoint. Must be one of ${CATEGORIES.join(", ")}');
  }
  var res = await request(endpoint);
  return res['results'][0];
}

/// Fetch multiple results from a specified endpoint
Future<List<dynamic>> fetchMultiple(String endpoint, {int amount = 5}) async {
  if (amount > 20) amount = 20;
  if (amount < 1) amount = 2;
  endpoint = endpoint.toLowerCase();
  if (!CATEGORIES.contains(endpoint)) {
    throw ('$endpoint is not a valid endpoint. Must be one of ${CATEGORIES.join(", ")}');
  }
  var res = await request('${endpoint}?amount=$amount');
  return res['results'];
}
