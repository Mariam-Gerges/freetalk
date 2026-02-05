import 'package:flutter/material.dart';
import 'package:freetalk/core/helper/spacing.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/feature/auth/widget/custom_button.dart';
import 'package:freetalk/feature/auth/widget/custom_text_button.dart';

import 'package:freetalk/feature/auth/widget/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(90),

                        /// Title
                        Text(
                          'Create Account',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        verticalSpace(8),

                        /// Login row
                        Row(
                          children: [
                            Text(
                              'Already have an account?',

                              style: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 16,
                              ),
                            ),

                            CustomTextButton(
                              title: 'Login',
                              textColor: AppColors.white,
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.loginScreen,
                                );
                              },
                            ),
                          ],
                        ),

                        verticalSpace(20),

                        /// Username
                        CustomTextFormField(
                          controller: usernameController,
                          hintText: 'Username',
                          prefixIcon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter username';
                            }
                            return null;
                          },
                          border: null,
                        ),

                        verticalSpace(20),

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

                        verticalSpace(20),

                        /// Confirm Password
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm Password',
                          obscureText: isConfirmPasswordObscure,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordObscure =
                                    !isConfirmPasswordObscure;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          border: null,
                        ),

                        verticalSpace(35),

                        /// Sign Up Button
                        CustomButton(
                          title: 'Sign up',
                          textColor: null,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              final username = usernameController.text;
                              final email = emailController.text;
                              final password = passwordController.text;

                              debugPrint('USERNAME: $username');
                              debugPrint('EMAIL: $email');
                              debugPrint('PASSWORD: $password');

                              // Navigate to HomeScreen after signup
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.loginScreen,
                              );
                            }
                          },
                          isDarkMode: false,
                        ),

                        verticalSpace(30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
