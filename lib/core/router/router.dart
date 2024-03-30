import 'package:flutter/material.dart';
import 'package:garcon/models/models.dart';
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
  static const String photoView = '/photoView';
  static const String reservationCheckout = '/reservationCheckout';
  static const String pickupsCheckout = '/pickupsCheckout';
  static const String successfulBooking = '/successfulBooking';
  static const String search = '/search';
  static const String aboutUs = '/aboutUs';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
  static const String contactUs = '/contactUs';
  static const String cart = '/cart';
  static const String payment = '/payment';

  static const List<String> aboutTaps = [
    terms,
    privacy,
    aboutUs,
    contactUs,
  ];

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
        return MaterialPageRoute(
            builder: (_) => const FilteredRestaurantsScreen());
      case photoView:
        String image = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PhotoViewScreen(image: image),
        );
      case reservationCheckout:
        Reservation reservation = routeSettings.arguments as Reservation;
        return MaterialPageRoute(
          builder: (_) => ReservationCheckoutScreen(
            reservation: reservation,
          ),
        );
      case successfulBooking:
        return MaterialPageRoute(
            builder: (_) => const SuccessfulBookingScreen());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      case privacy:
        return MaterialPageRoute(builder: (_) => const PrivacyScreen());
      case terms:
        return MaterialPageRoute(builder: (_) => const TermsScreen());
      case contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case cart:
        Restaurant restaurant = routeSettings.arguments as Restaurant;
        return MaterialPageRoute(
          builder: (_) => CartScreen(
            restaurant: restaurant,
          ),
        );
      case pickupsCheckout:
        final Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        final Restaurant restaurant = arguments['restaurant'] as Restaurant;
        final String amount = arguments['amount'] as String;

        return MaterialPageRoute(
          builder: (_) => PickupsCheckout(
            restaurant: restaurant,
            amount: amount,
          ),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
