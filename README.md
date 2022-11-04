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

var res = nb.fetch(endpoint: 'neko');
```

## Classes 
Detailed documentation can be found in the [Package API Reference](https://pub.dev/documentation/nekos_best/latest/nekos_best/nekos_best-library.html). There is also examples on general usage of the package in the [Official Nekos.Best docs](https://docs.nekos.best/examples/unofficial/dart.html).

The package exports a `Client` class and a `fetch` method. The fetch method uses the `Client` classes `Client.fetch` method internally. The client class has other two methods, a `search` method and a `fetchFile` method.

All possible usages are listed in details in the [example/](./example/) directory.

## Response
There are two classes: NBResponse & NBBufferResponse. They have the following fields. Refer to the officials [nekos.best docs](https://docs.nekos.best/) for more info.
```dart
class NBResponse {
  final String url;
  final String? artist_href;
  final String? artist_name;
  final String? source_url;
  final String? anime_name;
}

class NBBufferResponse {
  final List<int> data;
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
See [example/structs_example.dart](./example/structs_example.dart) for more.
## Author

**nekos_best_dart** © [Yakiyo](https://github.com/Yakiyo). Authored and maintained by Yakiyo.

Released under [MIT](https://opensource.org/licenses/MIT) License
