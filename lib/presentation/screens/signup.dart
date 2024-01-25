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
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: Space.all(1, .5),
                      border: const OutlineInputBorder(),
                      labelText: "Email Address*"),
                ),
                Space.yf(1.8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppDimensions.normalize(40),
                      height: AppDimensions.normalize(19),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(.5)),
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
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: Space.all(1, .5),
                            border: const OutlineInputBorder(),
                            labelText: "Mobile*"),
                      ),
                    ),
                  ],
                ),
                Space.yf(1.8),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: Space.all(1, .5),
                      border: const OutlineInputBorder(),
                      labelText: "Password*"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
