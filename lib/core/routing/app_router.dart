import 'package:flutter/material.dart';
import 'package:freetalk/feature/account/screens/account_screen.dart';
import 'package:freetalk/feature/auth/screens/forget_passward.dart';
import 'package:freetalk/feature/auth/screens/login_screen.dart';
import 'package:freetalk/feature/auth/screens/signup_screen.dart';
import 'package:freetalk/feature/chat_bot/screen/chat_bot.dart';
import 'package:freetalk/feature/dectionary/screens/dectionary_screen.dart';
import 'package:freetalk/feature/onbording/screens/onbording1_screen.dart';
import 'package:freetalk/feature/onbording/screens/onbording2_screen.dart';
import 'package:freetalk/feature/onbording/screens/onbording3_screen.dart';
import 'package:freetalk/feature/settings/screens/setting_screen.dart';
import 'package:freetalk/feature/splash/screens/splash_screen.dart';
import 'package:freetalk/feature/supported_language/screens/supported_language.dart';
import 'package:freetalk/feature/translate/screens/translate_screen.dart';

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
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      /// SIGNUP SCREEN
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      //FORGET PASSWORD SCREEN
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      // /// MAIN SCREEN
      case Routes.translateScreen:
        return MaterialPageRoute(builder: (_) => const TranslateScreen());

      case Routes.dictionaryScreen:
        return MaterialPageRoute(builder: (_) => const DectionaryScreen());
      case Routes.accountScreen:
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      case Routes.chatbotScreen:
        return MaterialPageRoute(builder: (_) => const ChatBot());
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());

      case Routes.supportedlanguageScreen:
        return MaterialPageRoute(builder: (_) => const SupportedLanguage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
