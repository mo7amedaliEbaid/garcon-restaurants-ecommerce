import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/application/application.dart';
import '../widgets.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  void initState() {
    context.read<PrivacyBloc>().add(GetPrivacyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Privacy Policy"),
      body: BlocBuilder<PrivacyBloc, PrivacyState>(
        builder: (context, state) {
          if (state is PrivacyError) {
            return Center(
              child: Text(
                "error loading info",
                style: AppText.h3b,
              ),
            );
          } else if (state is PrivacyLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PrivacyLoaded) {
            return Padding(
              padding: Space.hf(1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.yf(1.5),
                  Text(
                    state.privacy.header1.capitalize(),
                    style: AppText.h3b?.copyWith(height: 2),
                  ),
                  verseText(
                    text: state.privacy.subheader1,
                    withPadding: false,
                  ),
                  Space.yf(1.5),
                  Text(
                    state.privacy.header2.capitalize(),
                    style: AppText.h3b?.copyWith(height: 2),
                  ),
                  verseText(
                    text: state.privacy.subheader2,
                    withPadding: false,
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
    ;
  }
}
