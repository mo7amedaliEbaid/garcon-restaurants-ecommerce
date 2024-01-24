import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Sign up",
      ),
      body: Center(
        child: Column(
          children: [
            Space.yf(4.5),
            SvgPicture.asset(
              AppAssets.logoText,
              colorFilter: const ColorFilter.mode(
                AppColors.deepRed,
                BlendMode.srcIn,
              ),
              height: AppDimensions.normalize(18),
            ),
            Space.yf(4.5),
           Text("Create an Account",style: AppText.h1b,)
          ],
        ),
      ),
    );
  }
}
