import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "About us"),
      body: SingleChildScrollView(
        child: BlocBuilder<AboutUsBloc, AboutUsState>(
          builder: (context, state) {
            if (state is AboutUsLoaded) {
              return Column(
                children: [
                  Space.yf(),
                  restaurantCachedNetworkImage(AppStrings.aboutUsImage),
                  Space.yf(1.5),
                  verseText(text: state.aboutUs.verse1),
                  Space.yf(2),
                  verseText(text: state.aboutUs.verse2),
                  Space.yf(2),
                ],
              );
            } else {
              return Center(
                child: Text(
                  "error loading info",
                  style: AppText.h3b,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
