import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../models/models.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  CountryCode selectedCountry = CountryCode.fromCountryCode('EG');

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  bool isValid = true;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
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
                  customTextField(
                      labelText: "Email Address*",
                      controller: _emailController,
                      validator: _validators.validateEmail),
                  Space.yf(1.8),
                  customTextField(
                      labelText: "User Name*",
                      controller: _userNameController,
                      validator: _validators.validateUserName),
                  Space.yf(1.8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: AppDimensions.normalize(40),
                        height: AppDimensions.normalize(19),
                        margin: !isValid
                            ? EdgeInsets.only(
                                bottom: AppDimensions.normalize(9))
                            : EdgeInsets.zero,
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
                                log(selectedCountry.toString());
                                log(selectedCountry.code.toString());
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
                        child: customTextField(
                          labelText: "Mobile*",
                          controller: _phoneController,
                          validator: _validators.validateNumbers,
                        ),
                      ),
                    ],
                  ),
                  Space.yf(1.8),
                  customTextField(
                    labelText: "Password*",
                    controller: _passwordController,
                    validator: _validators.validatePassword,
                  ),
                  Space.yf(1.8),
                  customTextField(
                    labelText: "Confirm Password*",
                    controller: _confirmPasswordController,
                    validator: (value) => _validators.validateConfirmPassword(
                      _passwordController.text,
                      value,
                    ),
                  ),
                  Space.yf(2.8),
                  "By creating an account you agree to our\nTerms of Service and Privacy Policy"
                      .applyStyle(
                    defaultStyle: AppText.b1!.copyWith(
                      height: AppDimensions.normalize(.7),
                    ),
                    wordStyles: {
                      'Service': AppText.b1b!.copyWith(
                        color: AppColors.deepRed,
                      ),
                      'Policy': AppText.b1b!.copyWith(
                        color: AppColors.darkPurple,
                      ),
                    },
                    textAlign: TextAlign.center,
                  ),
                  Space.yf(3.5),
                  BlocConsumer<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state.status == SignUpStatus.error) {
                        customDialog(context,
                            text: "Error Occurred\nTry Again!",
                            buttonText: "Dismiss", onPressed: () {
                          Navigator.pop(context);
                        });
                      }
                      if (state.status == SignUpStatus.success) {
                        customDialog(context,
                            text:
                                "You have successfully\nRegistered with Garcoon",
                            buttonText: "My Account", onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRouter.root, (route) => false);
                          context
                              .read<NavigationCubit>()
                              .updateTab(NavigationTab.accountTap);
                        });
                      }
                    },
                    builder: (context, state) {
                      return customElevatedButton(
                        withArrow: (state.status == SignUpStatus.submitting)
                            ? false
                            : true,
                        width: double.infinity,
                        height: AppDimensions.normalize(21),
                        color: AppColors.deepRed,
                        borderRadius: AppDimensions.normalize(5),
                        text: (state.status == SignUpStatus.submitting)
                            ? "WAIT"
                            : "SIGN UP",
                        textStyle: AppText.h3b!.copyWith(color: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            CurrentUser user = CurrentUser(
                              email: _emailController.text.trim(),
                              phoneNumber: _phoneController.text.trim(),
                              userName: _userNameController.text.trim(),
                              countryCode: selectedCountry.toString(),
                              country: selectedCountry.code.toString(),
                            );
                            context.read<SignUpBloc>().add(
                                  SignUpWithCredential(
                                    user: user,
                                    password: _passwordController.text,
                                  ),
                                );
                          } else {
                            setState(() {
                              isValid = false;
                            });
                          }
                        },
                      );
                    },
                  ),
                  Space.yf(1.5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
