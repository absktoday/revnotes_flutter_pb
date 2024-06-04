import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revnotes_flutter_pb/services/pocketbase_service.dart';
import 'package:revnotes_flutter_pb/widgets/terms_and_policy_footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.abrilFatface(
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Submit Button
                    ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          await PocketBaseService.instance
                              .collection("users")
                              .authWithPassword("absktoday", "Ab9VxHUJbS908FK");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(1),
                        foregroundColor: Theme.of(context).colorScheme.surface,
                        backgroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 20),
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Login With Passkeys",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Do not have an account?",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 2),
                        TextButton(
                          onPressed: () => context.go("/register"),
                          child: const Text("Register"),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const TermsAndPolicyFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
