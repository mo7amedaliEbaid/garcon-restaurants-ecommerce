import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/presentation/widgets.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/configs/configs.dart';

import '../../application/application.dart';
import '../../models/models.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final contactUs = ContactUs(
      id: FirebaseAuth.instance.currentUser?.uid ?? "",
      name: _nameController.text,
      mobileNumber: _mobileController.text,
      email: _emailController.text,
      message: _messageController.text,
      timestamp: Timestamp.now(),
    );

    context.read<ContactUsBloc>().add(AddContactUs(contactUs));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Contact Us",
      ),
      body: BlocListener<ContactUsBloc, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsSuccess) {
            customDialog(
              context,
              text: "Message Send Successfully",
              onPressed: () {
                _mobileController.clear();
                _emailController.clear();
                _nameController.clear();
                _messageController.clear();
                Navigator.pop(context);
              },
              buttonText: "Dismiss",
            );
          } else if (state is ContactUsFailure) {
            customDialog(
              context,
              text: state.error.toString(),
              onPressed: () {
                Navigator.pop(context);
              },
              buttonText: "Try Again",
            );
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Space.yf(2.5),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppDimensions.normalize(10),
                  ),
                  child: Text(
                    "Customer Support",
                    style: AppText.h2b,
                  ),
                ),
                Space.yf(.8),
                Text(
                  "Send us message via WhatsApp",
                  style: AppText.h2?.copyWith(letterSpacing: 0),
                ),
                Space.yf(.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.whats,
                      colorFilter: const ColorFilter.mode(
                        Colors.green,
                        BlendMode.srcIn,
                      ),
                    ),
                    Space.xf(.5),
                    Text(
                      "+201016381636",
                      style: AppText.h2b,
                    )
                  ],
                ),
                Space.yf(3.5),
                Text(
                  "Drop us a Message",
                  style: AppText.h2b,
                ),
                Padding(
                  padding: Space.all(1.2, 2),
                  child: Column(
                    children: [
                      customTextField(
                        labelText: "Name*",
                        controller: _nameController,
                      ),
                      Space.yf(1.2),
                      customTextField(
                        labelText: "Mobile Number*",
                        controller: _mobileController,
                      ),
                      Space.yf(1.2),
                      customTextField(
                        labelText: "Email*",
                        controller: _emailController,
                      ),
                      Space.yf(1.2),
                      SizedBox(
                        height: AppDimensions.normalize(50),
                        child: customTextField(
                          labelText: "Message*",
                          controller: _messageController,
                          isExpanded: true,
                        ),
                      ),
                      Space.yf(2),
                      BlocBuilder<ContactUsBloc, ContactUsState>(
                        builder: (context, state) {
                          return customElevatedButton(
                            width: double.infinity,
                            height: AppDimensions.normalize(21),
                            color: AppColors.deepRed,
                            borderRadius: AppDimensions.normalize(5),
                            text: state is ContactUsLoading
                                ? "Wait"
                                : "Send Message",
                            textStyle:
                                AppText.h2b!.copyWith(color: Colors.white),
                            onPressed: _sendMessage,
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
