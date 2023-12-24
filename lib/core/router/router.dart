import 'package:flutter/material.dart';

import '../../presentation/screens/screens.dart';

sealed class AppRouter {
  static const String splash = '/';
  static const String ads = '/ads';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ads:
        return MaterialPageRoute(builder: (_) => const AdsScreen());

      default:
        throw Exception('Route not found!');
    }
  }
}
