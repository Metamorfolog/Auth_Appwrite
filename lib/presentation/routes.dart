import 'package:auth_app/pages/main_screen.dart';
import 'package:flutter/material.dart';

import '../login_service/pages/login.dart';
import '../login_service/pages/signup.dart';
import '../pages/profile.dart';

import '../pages/home.dart';

class AppRoutes {
  static const String login = "login";
  static const String signup = "signup";
  static const String profile = "profile";
  static const String home = "home";
  static const String main = "main";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          switch (settings.name) {
            case profile:
              return ProfilePage();
            case home:
              return HomePage();
            case signup:
              return SignupPage();
            case login:
              return LoginPage();
            case main:
            default:
              return MainScreen();
          }
        });
  }
}
