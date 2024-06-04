import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPolicyFooter extends StatelessWidget {
  const TermsAndPolicyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          const TextSpan(
            text:
                "By creating an account and/or logging in, you agree to RevNotes ",
          ),
          TextSpan(
            text: "Terms of Service",
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to the Terms of Service section
              },
          ),
          const TextSpan(
            text: " and ",
          ),
          TextSpan(
            text: "Privacy Policy",
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to the Privacy Policy section
              },
          ),
          const TextSpan(
            text: ".",
          ),
        ],
      ),
    );
  }
}
