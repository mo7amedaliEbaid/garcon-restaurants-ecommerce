import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../application/application.dart';
import '../../core/core.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Space.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: AppText.h2b,
            ),
            Space.ym!,
            customElevatedButton(
                width: double.infinity,
                height: AppDimensions.normalize(20),
                color: AppColors.deepRed,
                borderRadius: AppDimensions.normalize(5),
                text: "Log Out",
                textStyle: AppText.h3b!.copyWith(color: Colors.white),
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutRequestedEvent());
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouter.splash,
                    (route) => false,
                  );
                }),

          ],
        ),
      ),
    );
  }
}
