import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

class SuccessfulBookingScreen extends StatelessWidget {
  const SuccessfulBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SUCCESS",
              style: AppText.h2b,
            ),
            Space.yf(.5),
            Icon(
              Icons.check_circle,
              color: AppColors.deepGreen,
              size: AppDimensions.normalize(33),
            ),
            Space.yf(),
            successBookingRow(
                leftText: "Transaction ID", rightText: "#56478566"),
            Space.yf(.3),
            successBookingRow(leftText: "Payment ID", rightText: "#56648997"),
            Space.yf(.3),
            successBookingRow(leftText: "Order ID", rightText: "#8765"),
            Space.yf(4.3),
            customElevatedButton(
                width: AppDimensions.normalize(100),
                height: AppDimensions.normalize(20),
                color: AppColors.deepRed,
                borderRadius: AppDimensions.normalize(5),
                text: "View Booking",
                textStyle: AppText.h3b!.copyWith(color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRouter.root, (route) => false);
                  context
                      .read<NavigationCubit>()
                      .updateTab(NavigationTab.reservationTap);
                })
          ],
        ),
      ),
    );
  }
}

Widget successBookingRow(
    {required String leftText, required String rightText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        leftText,
        style: AppText.h2,
      ),
      Space.xf(.4),
      Text(
        rightText,
        style: AppText.h2b,
      ),
    ],
  );
}
