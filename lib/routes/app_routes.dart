import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const main = '/main';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    main: (_) => const MainScreen(),
  };
}
