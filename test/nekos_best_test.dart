import 'package:nekos_best/nekos_best.dart' as nb;
import 'package:test/test.dart';

void main() {
  group('nekos_best.dart test :)', () {
    var client = nb.Client();
    test('Fetch test', () async {
      var res = await nb.fetch(endpoint: 'neko');
      expect(res.isNotEmpty, true);

      var res2 = await client.fetch(endpoint: 'kitsune');
      expect(res2.isNotEmpty, true);
    });

    test('Random Fetch test', () async {
      var res = await client.fetch();
      expect(res.isNotEmpty, true);
    });

    test('Fetch Multiple test', () async {
      var res = await client.fetch(endpoint: 'neko', amount: 4);
      expect(res.length == 4, true);
    });

    test('Search Test', () async {
      var res = await client.search('Gochuumon wa Usagi Desuka??', endpoint: 'baka');
      expect(res.isNotEmpty, true);
    });

    test('Fetch File Test', () async {
      var res = await client.fetchFile('kitsune');
      expect(res.data.isNotEmpty, true);
    });
  });
}
