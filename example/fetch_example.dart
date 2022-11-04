// ignore_for_file: unused_local_variable

import 'package:nekos_best/nekos_best.dart' show fetch, Client;

void main() async {
  /// Using the regular `fetch` method
  var neko = await fetch(endpoint: 'neko');
  /// Using regular `fetch` with amount
  var fiveNekos = await fetch(endpoint: 'neko', amount: 5);

  /// Using the [Client] class
  var nbClient = Client();
  var neko2 = await nbClient.fetch(endpoint: 'neko');

  /// Both the `fetch` and `Client.fetch` method are the same function.
  /// For quick use, the `fetch` function is okay. It internally initializes
  /// a `Client` class and uses its fetch method. So if it's going to be used
  /// several times, its better to just initiate a Client anc use its fetch method.
}
