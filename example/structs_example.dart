import 'package:nekos_best/nekos_best.dart' show Client;

void main() async {
  var client = Client();

  /// The methods [fetch] and [search] return [List<NBResponse>]
  var nbResponse = await client.fetch(endpoint: 'waifu');

  /// Access NBResponse class's property's with dot notation
  print(
      'Waifu link: ${nbResponse[0].url}, Art by: ${nbResponse[0].anime_name} ');
  var nbres = nbResponse[0];
  // NBResponse properties
  nbres.url; // Always present. Type: String
  nbres.anime_name; // Only present in GIF endpoints. Type: String?
  nbres.artist_href; // Present in PNG endpoints Type: String?
  nbres.anime_name; // Present in PNG endpoints Type: String?
  nbres.source_url; // Present in PNG endpoints Type: String?

  /// The method [fetchFile] returns a single [NBBufferResponse] class
  /// which has all the methods of [NBResponse] except instead of a
  /// [url] property, it has a [data] property of type [List<int>]
  var buffer = await client.fetchFile('highfive');

  /// NBBufferResponse properties
  buffer.data; // Type: List<int> or Uint8List
  buffer.anime_name;
  buffer.artist_name;
  buffer.artist_href;
  buffer.source_url;

  /// See [fetchfile_example.dart](./fetchfile_example.dart) on writing the data to a file
}
