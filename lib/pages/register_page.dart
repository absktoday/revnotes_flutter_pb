import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revnotes_flutter_pb/widgets/terms_and_policy_footer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // password visible state
  bool _isObscure = true;

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
                      "Register",
                      style: GoogleFonts.abrilFatface(
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Email Field
                    Text(
                      "Email",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'john.doe@example.com',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          // Set border radius here
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary), // Set border color here
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Password Field
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Password",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          // Set border radius here
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary), // Set border color here
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
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
                        "Register",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 2),
                        TextButton(
                          onPressed: () => context.go("/login"),
                          child: const Text("Sign In"),
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
