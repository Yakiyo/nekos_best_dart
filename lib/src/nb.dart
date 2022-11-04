import 'util.dart';
import 'structs.dart';

/// Quick function to fetch a response
///
/// If it's going to be used multiple times, it's better
/// to initiate a [Client] class and use its fetch method
Future<List<NBResonse>> fetch({String? endpoint = null, int amount = 1}) async {
  return Client().fetch(endpoint: endpoint, amount: amount);
}

/// Base client to interact with the api.
class Client {
  Map<String, dynamic> _endpoints = {};

  /// Getter for the endpoints
  Map<String, dynamic> get endpoint => _endpoints;

  /// Fetch a random instance of a endpoint from the api
  ///
  /// Arguments endpoint and amount are both optional.
  /// Amount defaults to 1 and endpoint defaults to a randomly generated one.
  Future<List<NBResonse>> fetch(
      {String? endpoint = null, int amount = 1}) async {
    if (amount > 20) amount = 20;
    if (amount < 1) amount = 1;
    if (endpoint is String) {
      endpoint = endpoint.toLowerCase();
      isValid(endpoint);
    } else {
      endpoint = randomCat();
    }

    var res = await requestJson("$endpoint?amount=$amount")
        .then((value) => value['results']);
    var arr = <NBResonse>[];
    res.forEach((element) {
      arr.add(NBResonse(element));
    });
    return arr;
  }

  /// Search for a query
  ///
  /// Refer to the official docs for more
  /// https://docs.nekos.best/api/endpoints.html#get-searchqueryxtypexcategoryxamountx
  Future<List<NBResonse>> search(String query,
      {String? endpoint = null, int amount = 1}) async {
    if (amount > 20) amount = 20;
    if (amount < 1) amount = 1;
    if (endpoint == null) {
      endpoint = randomCat();
    } else {
      endpoint = endpoint.toLowerCase();
      isValid(endpoint);
    }
    var type = IMAGE_CATEGORIES.contains(endpoint) ? 1 : 2;
    var res = await requestJson(
            "search?amount=$amount&type=$type&query=${Uri.encodeComponent(query)}&category=$endpoint")
        .then((value) => value['results']);
    var arr = <NBResonse>[];
    res.forEach((e) => arr.add(NBResonse(e)));
    return arr;
  }

  /// Fetch and download a random file with its metadata (if available).
  ///
  /// For more advanced options, you should use the `Client.fetch()` method and
  /// fetch the file yourself.
  Future<NBBufferResonse> fetchFile(String endpoint) async {
    endpoint = endpoint.toLowerCase();
    isValid(endpoint);
    if (_endpoints.isEmpty) {
      _endpoints = await requestJson('endpoints');
    }
    var metadata = _endpoints[endpoint] as Map<String, dynamic>;
    var min = int.parse(metadata['min'] as String);
    var max = int.parse(metadata['max'] as String);
    var res = await request(
        '$endpoint/${rand(min, max).toString().padLeft((metadata['max'] as String).length, '0')}.${metadata['format']}');
    return NBBufferResonse(res);
  }
}
