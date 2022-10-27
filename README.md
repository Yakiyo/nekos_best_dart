# Nekos.Best Dart
[![CI](https://github.com/Yakiyo/nekos_best_dart/actions/workflows/ci.yml/badge.svg)](https://github.com/Yakiyo/nekos_best_dart/actions/workflows/ci.yml)
[![Pub Package](https://img.shields.io/pub/v/nekos_best.svg)](https://pub.dev/packages/nekos_best)


A minimal Dart package for interacting with [Nekos.best](https://nekos.best) api.

## Getting started

Add the package to your project's `pubspec.yaml` file. You can use the dart cli
```bash
$ dart pub add nekos_best
```

## Usage

Import the package in your dart file and use the methods

```dart
import 'package:nekos_best/nekos_best.dart' as nb;

var res = nb.fetch('neko');
```

## Methods
The package only exports a single function

### `Future<List<NBResonse>> fetch({String? endpoint = null, int amount = 1})`

You can specify `endpoint` and `amount` thought both are optional. By default amount is set to 1. If endpoint is not specified, it chooses a random one.
The function returns a List<[**NBResponse**](#response)>

Examples are in [example/fetch.dart](./example/fetch.dart) file.

## Response
A nb response class has the following fields. Refer to the officials [nekos.best docs](https://docs.nekos.best/) for more info.
```dart
class NBResponse {
  final String url;
  final String? artist_href;
  final String? artist_name;
  final String? source_url;
  final String? anime_name;
}
```
You can access the fields with dot notation i.e.
```dart
var neko_url = neko.url; // neko is an instance of NBResponse
```

## Author

**nekos_best_dart** © [Yakiyo](https://github.com/Yakiyo). Authored and maintained by Yakiyo.

Released under [MIT](https://opensource.org/licenses/MIT) License
