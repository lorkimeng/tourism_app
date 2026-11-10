import 'package:flutter/material.dart';
import 'package:tourism_app/screens/register_screen.dart';

import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const main = '/main';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    register: (_) => const RegisterScreen(),
    main: (_) => const MainScreen(),
  };
}
