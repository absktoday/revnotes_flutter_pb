import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:revnotes_flutter_pb/home_page.dart';
import 'package:revnotes_flutter_pb/login_page.dart';
import 'package:revnotes_flutter_pb/pocketbase_service.dart';

void main() async {
  await PocketBaseService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const Rev(),
    );
  }
}

class Rev extends StatelessWidget {
  const Rev({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthStoreEvent>(
      stream: PocketBaseService.instance.authStore.onChange,
      builder: (context, snapshot) {
        if (PocketBaseService.instance.authStore.isValid) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
