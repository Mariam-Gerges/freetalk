import 'package:flutter/material.dart';
import 'package:freetalk/core/helper/spacing.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/feature/auth/widget/custom_button.dart';
import 'package:freetalk/feature/auth/widget/custom_text_button.dart';
import 'package:freetalk/feature/auth/widget/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(100),

                  /// Title
                  Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  verticalSpace(16),

                  /// Email
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    border: null,
                  ),

                  verticalSpace(20),

                  /// Password
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: isPasswordObscure,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordObscure = !isPasswordObscure;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    border: null,
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.forgotPasswordScreen,
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  verticalSpace(35),

                  /// Login Button
                  CustomButton(
                    title: 'Login',
                    textColor: null,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final password = passwordController.text;

                        debugPrint('EMAIL: $email');
                        debugPrint('PASSWORD: $password');

                        Navigator.pushReplacementNamed(
                          context,
                          Routes.supportedlanguageScreen,
                        );
                      }
                    },
                    isDarkMode: false,
                  ),

                  verticalSpace(20),

                  /// Signup row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      horizontalSpace(6),
                      CustomTextButton(
                        title: 'Sign Up',
                        textColor: AppColors.primary,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.signupScreen,
                          );
                        },
                      ),
                    ],
                  ),

                  verticalSpace(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
