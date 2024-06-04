import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PocketBaseService {}

class StorageTest {
  static Future<void> init() async {
    const storage = FlutterSecureStorage();

    storage.write(key: "key", value: "Abhishek Saral");

    String? value = await storage.read(key: "key");

    print("vale $value");
  }
}
