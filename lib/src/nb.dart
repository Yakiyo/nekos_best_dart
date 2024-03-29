import 'dart:convert' show jsonDecode;
import 'util.dart';
import 'structs.dart';

/// Quick function to fetch a response
///
/// If it's going to be used multiple times, it's better
/// to initiate a [Client] class and use its fetch method
Future<List<NBResponse>> fetch(
    {String? endpoint = null, int amount = 1}) async {
  return Client().fetch(endpoint: endpoint, amount: amount);
}

/// Base client to interact with the api.
class Client {
  Map<String, dynamic>? _endpoints;
  NBRateLimitError? RateLimit;

  /// Getter for the endpoints
  Map<String, dynamic>? get endpoint => _endpoints;

  /// Fetch a random instance of a endpoint from the api
  ///
  /// Arguments endpoint and amount are both optional.
  /// Amount defaults to 1 and endpoint defaults to a randomly generated one.
  Future<List<NBResponse>> fetch(
      {String? endpoint = null, int amount = 1}) async {
    if (amount > 20) throw NBArgumentError("Amount cannot be greater than 20");
    if (amount < 1) throw NBArgumentError("Amount cannot be less than 1");
    if (endpoint is String) {
      endpoint = endpoint.toLowerCase();
      isValid(endpoint);
    } else {
      endpoint = randomCat();
    }

    var res = await requestJson("$endpoint?amount=$amount")
        .then((value) => value['results']);
    var arr = <NBResponse>[];
    res.forEach((element) {
      arr.add(NBResponse(element));
    });
    return arr;
  }

  /// Search for a query
  ///
  /// Note: This endpoint is currently unstable and may be reworked.
  /// Refer to the official docs for more
  /// https://docs.nekos.best/api/endpoints.html#get-searchqueryxtypexcategoryxamountx
  Future<List<NBResponse>> search(String query,
      {String? endpoint = null, int amount = 1}) async {
    // If Ratelimit isnt null, then...
    if (RateLimit != null) {
      // If ratelimit is yet valid, throw it to the user
      if (!DateTime.now().isAfter(RateLimit!.resetsIn)) {
        throw RateLimit as NBRateLimitError;
      }
      // else RateLimit is no longer valid, so make it null and continue
      RateLimit = null;
    }

    if (amount > 20) throw NBArgumentError("Amount cannot be greater than 20");
    if (amount < 1) throw NBArgumentError("Amount cannot be less than 1");
    if (endpoint == null) {
      endpoint = randomCat();
    } else {
      endpoint = endpoint.toLowerCase();
      isValid(endpoint);
    }
    var type = IMAGE_CATEGORIES.contains(endpoint) ? 1 : 2;
    var res = await request(
        "search?amount=$amount&type=$type&query=${Uri.encodeComponent(query)}&category=$endpoint");

    if (res.statusCode == 429) {
      var remaining = res.headers['x-rate-limit-remaining'];
      var resetsIn = res.headers['x-rate-limit-remaining'];
      RateLimit = NBRateLimitError(remaining as String, resetsIn as String);
      throw RateLimit as NBRateLimitError;
    }
    var json = jsonDecode(res.body) as Map<String, dynamic>;
    var arr = <NBResponse>[];
    json['results'].forEach((e) => arr.add(NBResponse(e)));
    return arr;
  }

  /// Fetch and download a random file with its metadata (if available).
  ///
  /// For more advanced options, you should use the `Client.fetch()` method and
  /// fetch the file yourself.
  Future<NBBufferResponse> fetchFile(String endpoint) async {
    final res = (await fetch(endpoint: endpoint))[0];
    final bytes = await request(res.url).then((value) => value.bodyBytes);
    return NBBufferResponse(bytes, res);
  }
}
