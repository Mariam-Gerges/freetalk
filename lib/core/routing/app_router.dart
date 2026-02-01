import 'package:flutter/material.dart';
import 'package:freetalk/feature/auth/screens/signin_screen.dart';
import 'package:freetalk/feature/onbording/screens/onbording1_screen.dart';
import 'package:freetalk/feature/onbording/screens/onbording2_screen.dart';
import 'package:freetalk/feature/onbording/screens/onbording3_screen.dart';
import 'package:freetalk/feature/splash/screens/splash_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// SPLASH SCREEN
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      /// ONBOARDING SCREEN
      case Routes.onboardingScreen1:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen1());
      case Routes.onboardingScreen2:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen2());
      case Routes.onboardingScreen3:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen3());

      /// LOGIN SCREEN
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (_) => getIt<AuthCubit>(),
      //       child: const LoginScreen(),
      //     ),
      //   );

      /// SIGNUP SCREEN
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      // /// MAIN SCREEN
      // case Routes.mainScreen:
      //   return MaterialPageRoute(builder: (_) => const MainScreen());

      // case Routes.dictionaryScreen:
      //   return MaterialPageRoute(builder: (_) => const DictionaryScreen(isDarkMode: false,));

      // /// LANGUAGE SCREEN
      // case Routes.supportedlanguageScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const SupportedLanguagesScreen(),
      //   );

      // /// FORGOT PASSWORD SCREEN
      // case Routes.forgotPasswordScreen:
      //   return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      default:
        return null;
    }
  }
}
