import 'package:flutter/material.dart';
import 'package:freetalk/feature/auth/widget/custom_button.dart';
import 'package:freetalk/feature/auth/widget/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isPasswordObscure;
  final VoidCallback onTogglePassword;
  final VoidCallback onLogin;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isPasswordObscure,
    required this.onTogglePassword,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Email
        CustomTextFormField(
          controller: emailController,
          hintText: 'Email',
        ),

        /// Password
        CustomTextFormField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: isPasswordObscure,
        ),

        /// Button
        CustomButton(
          title: 'Login',
          onTap: onLogin,
        ),
      ],
    );
  }
}