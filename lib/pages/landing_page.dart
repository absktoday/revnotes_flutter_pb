import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The simplest way to keep notes",
                style: GoogleFonts.abrilFatface(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                  "All your notes,synced to all your devices. Use RevNotes now in your browser."),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/login'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.surface,
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
                child: const Text("Open in Browser"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
