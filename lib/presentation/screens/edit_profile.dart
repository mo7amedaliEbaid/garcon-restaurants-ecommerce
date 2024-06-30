import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../core/core.dart';
import '../../models/models.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.currentUser});

  final CurrentUser currentUser;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late CountryCode selectedCountry;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  bool isValid = true;

  @override
  void initState() {
    selectedCountry = CountryCode.fromCountryCode(widget.currentUser.country);
    _userNameController.text = widget.currentUser.userName;
    _phoneNumberController.text = widget.currentUser.phoneNumber;

    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Edit Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.hf(1.6),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Space.yf(5.2),
                Text(
                  "Update Your Profile Data",
                  style: AppText.h2b,
                ),
                Space.yf(3.2),
                customTextField(
                    labelText: "User Name*",
                    controller: _userNameController,
                    validator: _validators.validateUserName),
                Space.yf(1.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppDimensions.normalize(40),
                      height: AppDimensions.normalize(19),
                      margin: !isValid
                          ? EdgeInsets.only(bottom: AppDimensions.normalize(9))
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(.5),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            AppDimensions.normalize(2),
                          ),
                        ),
                      ),
                      child: Center(
                        child: CountryCodePicker(
                          onChanged: (code) {
                            setState(() {
                              selectedCountry = code;
                              log(selectedCountry.toString());
                              log(selectedCountry.code.toString());
                            });
                          },
                          initialSelection: widget.currentUser.country,
                          favorite: [
                            widget.currentUser.countryCode,
                            widget.currentUser.country,
                          ],
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
                        controller: _phoneNumberController,
                        validator: _validators.validateNumbers,
                      ),
                    ),
                  ],
                ),
                Space.yf(20),
                customElevatedButton(
                    width: double.infinity,
                    height: AppDimensions.normalize(20),
                    color: AppColors.deepRed,
                    borderRadius: AppDimensions.normalize(5),
                    text: "Save",
                    textStyle: AppText.h3b!.copyWith(color: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        CurrentUser updatedUser = CurrentUser(
                          phoneNumber: _phoneNumberController.text.trim(),
                          userName: _userNameController.text.trim(),
                          countryCode: selectedCountry.toString(),
                          country: selectedCountry.code.toString(),
                        );

                        context.read<UserBloc>().add(StartUserEvent());
                        customDialog(
                          context,
                          text: "Your profile has been\nUpdated successfully !",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          buttonText: "Dismiss",
                        );
                      } else {
                        setState(() {
                          isValid = false;
                        });
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
