import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../configs/configs.dart';
import '../../core/core.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      appBar: customAppBar(context: context, title: "Sign In"),
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.hf(1.8),
          child: Center(
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
                Text(
                  "Sign In",
                  style: AppText.h1b,
                ),
                Space.yf(2),
                customTextField(
                    labelText: "Email",
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        left: AppDimensions.normalize(9),
                        right: AppDimensions.normalize(5),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.email,
                      ),
                    )),
                Space.yf(1.5),
                customTextField(
                    labelText: "Password",
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        left: AppDimensions.normalize(9),
                        right: AppDimensions.normalize(5),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.lock,
                      ),
                    )),
                Space.yf(.7),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot Password?",
                      style: AppText.h3,
                    )),
                Space.yf(2.7),
                customElevatedButton(
                    width: double.infinity,
                    height: AppDimensions.normalize(20),
                    color: AppColors.deepRed,
                    borderRadius: AppDimensions.normalize(5),
                    text: "SIGN IN",
                    textStyle: AppText.h3b!.copyWith(color: Colors.white),
                    onPressed: () {}),
                Space.yf(3.5),
                Text(
                  "Don’t have an account yet?",
                  style: AppText.h3,
                ),
                Space.yf(1.2),
                customElevatedButton(
                    width: double.infinity,
                    height: AppDimensions.normalize(20),
                    color: Colors.black,
                    borderRadius: AppDimensions.normalize(5),
                    text: "Create Account".toUpperCase(),
                    textStyle: AppText.h3b!.copyWith(color: Colors.white),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
