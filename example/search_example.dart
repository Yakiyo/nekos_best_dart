// ignore_for_file: unused_local_variable

import 'package:nekos_best/nekos_best.dart' show Client;

void main() async {
  var client = Client();

  /// Search using a query
  var search = client.search('Gochuumon wa Usagi Desuka??');

  /// Search using query & specifying an optional endpoint (defaults to a random category)
  var searchWithEndpoint =
      await client.search('Gochuumon wa Usagi Desuka??', endpoint: 'baka');

  /// Search using query & specifying an optional endpoint & an optional amount (defaults to 1)
  var searchComplex = await client.search('Gochuumon wa Usagi Desuka??',
      endpoint: 'baka', amount: 3);
}
