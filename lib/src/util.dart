import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math' show Random;
import './structs.dart';

/// Make a request to nekos.best. Private function for internal use only
Future<http.Response> request(String path) async {
  var url = Uri.parse('https://nekos.best/api/v2/$path');
  return await http.get(url, headers: {"User-Agent": "nekos_best.dart"});
}

/// Make http request to nekos.best and returns the body as json/map
Future<Map<String, dynamic>> requestJson(String path) async {
  var res = await request(path);
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body) as Map<String, dynamic>;
  } else {
    throw 'Error when requesting content from api. Got status code ${res.statusCode}';
  }
}

/// Checks if a endpoint is valid or not
void isValid(String endpoint) {
  if (!CATEGORIES.contains(endpoint)) {
    throw NBArgumentError(
        'Invalid category. $endpoint is not valid. Must be one of ${CATEGORIES.join(', ')}');
  }
}

/// Generates a random category
String randomCat() {
  return (CATEGORIES.toList()..shuffle()).first as String;
}

/// Simple arrow function to generate a random number
/// between range min and max
int rand(int min, int max) => min + Random().nextInt(max - min);
