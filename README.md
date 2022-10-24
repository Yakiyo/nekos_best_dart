# Nekos.Best Dart
[![CI](https://github.com/Yakiyo/nekos_best_dart/workflows/ci.yml/badge.svg)](https://github.com/dart-lang/yaml/actions?query=workflow%3A"Dart+CI"+branch%3Amaster)
[![Pub Package](https://img.shields.io/pub/v/nekos_best.svg)](https://pub.dev/packages/yaml)
[![package publisher](https://img.shields.io/pub/publisher/nekos_best.svg)](https://pub.dev/packages/yaml/publisher)

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

### `Future<Map<String, dynamic>> fetch([String? endpoint])`
Fetch results from an optionally specified category. If mentioned, it'll fetch from that category. If not mentioned, it will use a random category. Returns a single [response map](#response)

### `Future<List<Map<String, dynamic>>> fetchMultiple(String endpoint, {int amount = 5})`
Fetch multiple results from a specified endpoint. Endpoint is must, the amount is optional. If left unspecified, it defaults to 5. Maximum is 20. If provided value is more than 20, it resets to 20. Returns a list of [response map](#response)

Examples are in [example/fetch.dart](./example/fetch.dart) file.

## Response
A nb response has the following fields. The `url` property is always present. If the endpoint returns a static image, `artist_href` and `artist_name` might be present, the other two will be absent. If the endpoint returns a gif image, `source_url` and `anime_name` might be present, the other two will be absent. Refer to the officials [nekos.best docs](https://docs.nekos.best/) for more info.
```ts
{
  url: string,
  artist_href: string | undefined,
  artist_name: string | undefined,
  source_url: string | undefined,,
  anime_name: string | undefined,
}
```
You can access the fields like you would for a [Map](https://api.dart.dev/stable/1.10.1/dart-core/Map-class.html) class.
```dart
var neko = nb.fetch('neko');
print('Neko url: ${neko["url"]} Neko artist: ${neko["artist_name"]}');
```

## Author

**nekos_best_dart** © [Yakiyo](https://github.com/Yakiyo). Authored and maintained by Yakiyo.

Released under [MIT](https://opensource.org/licenses/MIT) License
