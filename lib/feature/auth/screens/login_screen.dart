import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/core/helper/spacing.dart';
import 'package:freetalk/core/helper/theme_helper.dart';
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
    return ThemeConsumer(
      builder: (context, isDarkMode) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    // Navigator.pushNamed(
                    //   context,
                    //   Routes.supportedlanguageScreen,
                    // );
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
                            color: Theme.of(context).textTheme.titleLarge?.color ??
                                Theme.of(context).colorScheme.onSurface,
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
                                color: isDarkMode
                                    ? AppColors.white
                                    : Theme.of(context).primaryColor,
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
                                title: '',
                                isLoading: true,
                                onTap: () {},
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
                                color: isDarkMode
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight,
                                fontSize: 14,
                              ),
                            ),
                            horizontalSpace(6),
                            CustomTextButton(
                              title: 'Sign Up',
                              textColor: isDarkMode
                                  ? AppColors.white
                                  : Theme.of(context).primaryColor,
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
      },
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
