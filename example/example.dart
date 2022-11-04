import 'package:nekos_best/nekos_best.dart' as nb;

void main() async {
  // Fetching one result
  var neko = await nb.fetch(endpoint: 'neko');
  print('printing neko $neko');

  // Fetching without a specified category
  var rand = await nb.fetch();
  print('printing random category $rand');

  // Fetching multiple results from a single endpoint
  var multi = await nb.fetch(endpoint: 'baka', amount: 6);
  print('printing multiple bakas $multi');
}