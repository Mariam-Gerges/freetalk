import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              Routes.signupScreen,
            );
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}