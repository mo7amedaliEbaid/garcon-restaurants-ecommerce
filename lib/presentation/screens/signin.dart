import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../application/blocs/sign_in/sign_in_bloc.dart';
import '../../configs/configs.dart';
import '../../core/core.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      appBar: customAppBar(context: context, title: "Sign In"),
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.hf(1.8),
          child: Center(
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
                    "Sign In",
                    style: AppText.h1b,
                  ),
                  Space.yf(2),
                  customTextField(
                      labelText: "Email",
                      controller: _emailController,
                      validator: _validators.validateEmail,
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
                      controller: _passwordController,
                      validator: _validators.validatePassword,
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
                  BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {
                      if (state.status == SignInStatus.error) {
                        customDialog(context,
                            text: "Error Occurred\nTry Again!",
                            buttonText: "Dismiss", onPressed: () {
                          Navigator.pop(context);
                        });
                      }
                      if (state.status == SignInStatus.success) {
                        customDialog(context,
                            text:
                                "You have successfully\nLogged in with Garcoon",
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
                          withArrow: (state.status == SignInStatus.submitting)
                              ? false
                              : true,
                          width: double.infinity,
                          height: AppDimensions.normalize(20),
                          color: AppColors.deepRed,
                          borderRadius: AppDimensions.normalize(5),
                          text: (state.status == SignInStatus.submitting)
                              ? "WAIT"
                              : "SIGN IN",
                          textStyle: AppText.h3b!.copyWith(color: Colors.white),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignInBloc>().add(
                                    SignInWithCredential(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                            }
                          });
                    },
                  ),
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
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRouter.signup);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
