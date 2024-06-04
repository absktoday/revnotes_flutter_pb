import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:revnotes_flutter_pb/services/pocketbase_service.dart';

class AuthStateNotifier extends ChangeNotifier {
  late final StreamSubscription<AuthStoreEvent> _authStoreEventStream;

  AuthStateNotifier() {
    _authStoreEventStream =
        PocketBaseService.instance.authStore.onChange.listen((event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _authStoreEventStream.cancel();
  }
}
