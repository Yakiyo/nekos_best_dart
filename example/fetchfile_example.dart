import 'package:nekos_best/nekos_best.dart' show Client;
import 'dart:io' show File;

void main() async {
  var client = Client();

  var file = await client.fetchFile('kitsune');

  /// Write the response image to a file
  File('./kitsune.png').writeAsBytesSync(file.data);
}
