import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  CountryCode selectedCountry = CountryCode.fromCountryCode('EG');

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Sign up",
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: Space.hf(1.8),
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
                  "Create an Account",
                  style: AppText.h1b,
                ),
                Space.yf(1.8),
                customTextField(labelText: "Email Address*"),
                Space.yf(1.8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppDimensions.normalize(40),
                      height: AppDimensions.normalize(19),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(.5)),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppDimensions.normalize(2)))),
                      child: Center(
                        child: CountryCodePicker(
                          onChanged: (code) {
                            setState(() {
                              selectedCountry = code;
                            });
                          },
                          initialSelection: 'EG',
                          favorite: const ['+20', 'EG'],
                          padding: EdgeInsets.zero,
                          showCountryOnly: false,
                          showFlag: true,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: AppDimensions.normalize(80),
                        child: customTextField(labelText: "Mobile*")),
                  ],
                ),
                Space.yf(1.8),
                customTextField(labelText: "Password*"),
                Space.yf(1.8),
                customTextField(labelText: "Confirm Password*"),
                Space.yf(2.8),
                "By creating an account you agree to our\nTerms of Service and Privacy Policy"
                    .applyStyle(
                        defaultStyle: AppText.b1!
                            .copyWith(height: AppDimensions.normalize(.7)),
                        wordStyles: {
                          'Service': AppText.b1b!.copyWith(
                            color: AppColors.deepRed,
                          ),
                          'Policy': AppText.b1b!.copyWith(
                            color: AppColors.darkPurple,
                          ),
                        },
                        textAlign: TextAlign.center),
                Space.yf(3.5),
                customElevatedButton(
                    width: double.infinity,
                    height: AppDimensions.normalize(21),
                    color: AppColors.deepRed,
                    borderRadius: AppDimensions.normalize(5),
                    text: "SIGN UP",
                    textStyle: AppText.h3b!.copyWith(color: Colors.white),
                    onPressed: () {},
                    withArrow: true),
                Space.yf(1.5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
