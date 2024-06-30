import 'package:flutter_dotenv/flutter_dotenv.dart';

sealed class Env {
  static final String stripePublishableKey = dotenv.env['stripePublishableKey'] ??'';
  static final String secretKey = dotenv.env['secretKey'] ?? '';
}
