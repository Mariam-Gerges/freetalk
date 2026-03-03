import 'dart:async';
import 'package:flutter/material.dart';
import 'package:freetalk/core/helper/spacing.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/feature/auth/widget/custom_button.dart';
import 'package:freetalk/feature/auth/widget/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Timer? timer;
  int timerSeconds = 30;
  bool canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timerSeconds = 30;
    canResend = false;
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timerSeconds == 0) {
        t.cancel();
        setState(() => canResend = true);
      } else {
        setState(() => timerSeconds--);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(50),
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpace(10),
                  const Text(
                    "Enter your email and we’ll send you a link to reset your password.",
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                  ),
                  verticalSpace(30),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Email Address',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Enter your email';
                      if (!RegExp(
                        r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                      ).hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    border: null,
                  ),
                  verticalSpace(16),
                  CustomButton(
                    title: 'Send Reset Link',
                    textColor: AppColors.white,
                 
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Reset link sent to your email"),
                          ),
                        );
                        startTimer();
                      }
                    },
                  ),
                  verticalSpace(25),
                  Center(
                    child: canResend
                        ? GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Link sent again"),
                                ),
                              );
                              startTimer();
                            },
                            child: const Text(
                              "Send again",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : Text(
                            "You can resend in $timerSeconds sec",
                            style: const TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 15,
                            ),
                          ),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
