import 'package:nekos_best/nekos_best.dart' as nb;
import 'package:test/test.dart';

void main() {
  group('nekos_best.dart test :)', () {
    test('Fetch test', () async {
      var res = await nb.fetch(endpoint: 'neko');
      expect(res.isNotEmpty, true);
    });

    test('Random Fetch test', () async {
      var res = await nb.fetch();
      expect(res.isNotEmpty, true);
    });

    test('Fetch Multiple test', () async {
      var res = await nb.fetch(endpoint: 'neko', amount: 4);
      expect(res.length == 4, true);
    });
  });
}
