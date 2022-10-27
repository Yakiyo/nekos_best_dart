import 'util.dart' show NBResonse, CATEGORIES, request;

Future<List<NBResonse>> fetch(String? endpoint, {int amount = 1}) async {
  if (amount > 20) amount = 20;
  if (amount < 1) amount = 1;
  endpoint ??= (CATEGORIES.toList()..shuffle()).first;
  endpoint = endpoint.toLowerCase();
  if (!CATEGORIES.contains(endpoint)) {
    throw ('$endpoint is not a valid endpoint. Must be one of ${CATEGORIES.join(", ")}');
  }
  var res = await request("$endpoint?amount=$amount")
      .then((value) => value['results']);
  var arr = <NBResonse>[];
  res.forEach((element) {
    arr.add(NBResonse(element));
  });
  return arr;
}
