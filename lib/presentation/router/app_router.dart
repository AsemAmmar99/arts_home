import 'package:flutter/material.dart';
import 'package:arts_home/core/constants.dart' as screens;

import '../screens/home/home_layout.dart';
import '../screens/splash/splash_screen.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      default:
        return null;
    }
  }
}