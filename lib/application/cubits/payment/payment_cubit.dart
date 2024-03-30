import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:garcon/core/core.dart';

part 'payment_state.dart';

// Define the payment Cubit
class PaymentCubit extends Cubit<PaymentState> {
  final Dio dio = Dio();

  PaymentCubit() : super(PaymentInitial());

  void createPaymentIntent({required String amount}) async {
    emit(PaymentProcessing());
    try {
      Response response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: {
          'amount': '100',
          'currency': 'USD',
          'payment_method_types[]': 'card'
        },
        options: Options(
          headers: {
            // Use Stripe account secret key here after Bearer
            'Authorization': 'Bearer ${Env.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
      );
      await initThePaymentSheet(stripeApiResponse: response.data);
    } catch (err) {
      emit(PaymentError(err.toString()));
    }
  }

  Future<void> initThePaymentSheet(
      {required Map<String, dynamic> stripeApiResponse}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: stripeApiResponse['client_secret'],
          googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
          style: ThemeMode.system,
          merchantDisplayName: 'Mo',
        ),
      );
      await displayPaymentSheet(stripeApiResponse: stripeApiResponse);
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }

  Future<void> displayPaymentSheet(
      {required Map<String, dynamic> stripeApiResponse}) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      emit(PaymentSuccess());
    } on StripeException catch (e) {
      emit(PaymentError(e.error.message.toString()));
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }
}
