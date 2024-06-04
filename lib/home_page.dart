import 'package:flutter/material.dart';
import 'package:revnotes_flutter_pb/pocketbase_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              PocketBaseService.instance.authStore.clear();
            },
            child: const Text("Sign Out")),
      ),
    );
  }
}
