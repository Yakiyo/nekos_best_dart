import 'util.dart' show NBResonse, CATEGORIES, requestJson;

/// Fetch a random instance of a endpoint from the api
///
/// Arguments endpoint and amount are both optional.
/// Amount defaults to 1 and endpoint defaults to a randomly generated one.
Future<List<NBResonse>> fetch({String? endpoint = null, int amount = 1}) async {
  if (amount > 20) amount = 20;
  if (amount < 1) amount = 1;
  endpoint ??= (CATEGORIES.toList()..shuffle()).first;
  endpoint = endpoint.toLowerCase();
  if (!CATEGORIES.contains(endpoint)) {
    throw ('$endpoint is not a valid endpoint. Must be one of ${CATEGORIES.join(", ")}');
  }
  var res = await requestJson("$endpoint?amount=$amount")
      .then((value) => value['results']);
  var arr = <NBResonse>[];
  res.forEach((element) {
    arr.add(NBResonse(element));
  });
  return arr;
}


