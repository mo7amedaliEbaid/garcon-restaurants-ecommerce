import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          chooseStack(
              title: "Booking",
              curvedSvg: AppAssets.redCurve,
              positionedSvg: AppAssets.booking,
              color: AppColors.deepRed,
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.root);
              }),
          SizedBox(
              height: AppDimensions.normalize(65),
              child: SvgPicture.asset(
                AppAssets.logoWithText,
                colorFilter: const ColorFilter.mode(
                    AppColors.darkPurple, BlendMode.srcIn),
              )),
          chooseStack(
              title: "Pickup",
              curvedSvg: AppAssets.purpleCurve,
              positionedSvg: AppAssets.pickup,
              color: AppColors.darkPurple,
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.root);
              }),
        ],
      ),
    );
  }
}
