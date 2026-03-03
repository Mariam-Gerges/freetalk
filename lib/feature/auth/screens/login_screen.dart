import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/core/helper/spacing.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/feature/auth/data/model/login_request_body.dart';
import 'package:freetalk/feature/auth/logic/auth_cubit.dart';
import 'package:freetalk/feature/auth/logic/auth_cubit_state.dart';
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
        backgroundColor: AppColors.primary,
        resizeToAvoidBottomInset: true,
        body: BlocListener<AuthCubit, AuthCubitState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (response) {
                Navigator.pushNamed(
                  context,
                  Routes.supportedlanguageScreen,
                );
              },
              failure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.message ?? 'Login failed'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          child: Padding(
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
                        color: AppColors.white,
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
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
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
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    verticalSpace(35),

                    /// Login Button
                    BlocBuilder<AuthCubit, AuthCubitState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => CustomButton(
                            title: 'Loading...',
                      onTap: () {
                        
                      },
                          ),
                          orElse: () => CustomButton(
                            title: 'Login',
                            textColor: null,
                            onTap: () => _handleLogin(context),
          
                          ),
                        );
                      },
                    ),

                    verticalSpace(20),

                    /// Signup row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 14,
                          ),
                        ),
                        horizontalSpace(6),
                        CustomTextButton(
                          title: 'Sign Up',
                          textColor: AppColors.white,
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.signupScreen,
                            );
                          },
                        ),
                      ],
                    ),

                    verticalSpace(16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final loginRequest = LoginRequestBody(
        usernameOrEmail: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      context.read<AuthCubit>().login(loginRequest);
    }
  }
}