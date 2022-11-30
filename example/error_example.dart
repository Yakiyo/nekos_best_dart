import 'package:nekos_best/nekos_best.dart'
    show fetch, NBError, NBArgumentError;

void main() async {
  /// All errors thrown by the library are a subclass of the `NBError` class.
  /// Catch an NBError class and then run further check with the `x is a` typechecks
  /// to do separate things for separate errors.

  try {
    // Amount cannot be more than 20 or less than 1, lib throws error
    var nekos = await fetch(endpoint: 'neko', amount: 21);
    print("Got five nekos $nekos");
  } on NBError catch (e) {
    // Catch on an NBError

    print("Got NBError. Attempting further catching...");

    if (e is NBArgumentError) {
      print("Got argument error $e");
    } else {
      print("Got a subclass of NBError but dk which. Got $e");
    }
  } catch (e) {
    // Unknown error that wasnt give from the library

    print("Unknown error $e");
  }
}
