import 'package:flutter/material.dart';
import 'package:revnotes_flutter_pb/config/router.dart';
import 'package:revnotes_flutter_pb/config/theme_config.dart';
import 'package:revnotes_flutter_pb/services/pocketbase_service.dart';

void main() async {
  await PocketBaseService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      darkTheme: ThemeConfig.dartTheme(context),
      theme: ThemeConfig.lightTheme(context),
      routerConfig: router,
    );
  }
}
