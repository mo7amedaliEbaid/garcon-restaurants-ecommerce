import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/constants/colors.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../core/validator/validator.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Change Password",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.hf(1.6),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Space.yf(3.5),
                customTextField(
                  labelText: "Current Password*",
                  controller: _passwordController,
                  validator: _validators.validatePassword,
                ),
                Space.yf(1.5),
                customTextField(
                  labelText: "New Password*",
                  controller: _newPasswordController,
                  validator: _validators.validatePassword,
                ),
                Space.yf(1.5),
                customTextField(
                  labelText: "Confirm New Password*",
                  controller: _confirmNewPasswordController,
                  validator: (value) => _validators.validateConfirmPassword(
                    _newPasswordController.text,
                    value,
                  ),
                ),
                Space.yf(22.5),
                customElevatedButton(
                    width: double.infinity,
                    height: AppDimensions.normalize(20),
                    color: AppColors.deepRed,
                    borderRadius: AppDimensions.normalize(5),
                    text: "Save",
                    textStyle: AppText.h3b!.copyWith(color: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<UserBloc>().add(ChangePasswordEvent(
                            currentPassword: _passwordController.text.trim(),
                            newPassword:
                                _confirmNewPasswordController.text.trim()));
                        customDialog(
                          context,
                          text:
                              "Your password has been\nChanged successfully !",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          buttonText: "Dismiss",
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
