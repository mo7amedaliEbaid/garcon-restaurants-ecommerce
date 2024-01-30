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
  static const String signIn = '/signIn';
  static const String editProfile = '/editProfile';
  static const String changePassword = '/changePassword';
  static const String choose = '/choose';
  static const String filteredRestaurants = '/filteredRestaurants';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ads:
        return MaterialPageRoute(builder: (_) => const AdsScreen());
      case choose:
        return MaterialPageRoute(builder: (_) => const ChooseScreen());
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
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case editProfile:
        CurrentUser currentUser = routeSettings.arguments as CurrentUser;
        return MaterialPageRoute(
            builder: (_) => EditProfileScreen(currentUser: currentUser));
      case changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case filteredRestaurants:
        return MaterialPageRoute(builder: (_) => const FilteredRestaurantsScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
