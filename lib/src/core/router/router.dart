import 'package:bookify/src/features/intro/presenter/pages/intro_page.dart';
import 'package:bookify/src/features/signin/presenter/pages/signin_page.dart';
import 'package:bookify/src/features/signup/presenter/pages/signup_page.dart';
import 'package:bookify/src/features/welcome/presenter/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static String currentRoute = "/";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      // Intro Page
      case '/intro':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const IntroPage(),
        );

      // Welcome Page
      case '/welcome':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const WelcomePage(),
        );
      // Signin Page
      case '/signin':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const SignInPage(),
        );
      // Signup Page
      case '/signup':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const SignUpPage(),
        );

      default:
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
