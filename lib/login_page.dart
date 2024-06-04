import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:revnotes_flutter_pb/pocketbase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await PocketBaseService.instance
                      .collection("users")
                      .authWithPassword("absktoday", "Ab9VxHUJbS908FK");
                } on ClientException catch (e) {
                  print("Error $e");
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
