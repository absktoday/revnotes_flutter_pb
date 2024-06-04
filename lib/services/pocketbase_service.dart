import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PocketBaseService {
  PocketBaseService._();

  static late PocketBase _pb;

  static Future<void> init() async {
    const storage = FlutterSecureStorage();

    final store = AsyncAuthStore(
      save: (String data) => storage.write(key: 'pb_auth', value: data),
      initial: await storage.read(key: 'pb_auth'),
    );

    _pb = PocketBase('https://pb.absk.io',
        httpClientFactory:
            kIsWeb ? () => FetchClient(mode: RequestMode.cors) : null,
        authStore: store);

    if (_pb.authStore.isValid) {
      await _pb.collection("users").authRefresh();
    } else {
      _pb.authStore.clear();
    }
  }

  static PocketBase get instance => _pb;
}
