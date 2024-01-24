import 'package:flutter/material.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/presentation/screens/restaurant.dart';
import '../../presentation/screens.dart';
import '../core.dart';

sealed class AppRouter {
  static const String splash = '/';
  static const String ads = '/ads';
  static const String root = '/root';
  static const String home = '/home';
  static const String restaurant = '/restaurant';
  static const String signup = '/signup';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ads:
        return MaterialPageRoute(builder: (_) => const AdsScreen());
      case root:
        return MaterialPageRoute(builder: (_) => const RootScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case restaurant:
        Restaurant restaurant = routeSettings.arguments as Restaurant;
        return MaterialPageRoute(
            builder: (_) => RestaurantScreen(restaurant: restaurant));
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
