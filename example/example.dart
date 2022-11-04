import 'package:nekos_best/nekos_best.dart' show fetch;

void main() async {
  /// Fetching one result
  var neko = await fetch(endpoint: 'neko');
  print('printing neko $neko');

  /// Fetching without a specified category
  var rand = await fetch();
  print('printing random category $rand');

  /// Fetching multiple results from a single endpoint
  var multi = await fetch(endpoint: 'baka', amount: 6);
  print('printing multiple bakas $multi');
}
