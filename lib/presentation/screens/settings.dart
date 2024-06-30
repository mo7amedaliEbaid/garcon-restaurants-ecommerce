import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
        padding: Space.hf(1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.yf(1.5),
            Text(
              "Settings",
              style: AppText.h1b,
            ),
            Space.yf(1.5),
            Text(
              "Configuration",
              style: AppText.h3b,
            ),
            Space.yf(1.2),
            settingsItem(
              title: "Notification",
              endWidget: SvgPicture.asset(
                AppAssets.notifications,
                colorFilter:
                    const ColorFilter.mode(AppColors.deepRed, BlendMode.srcIn),
              ),
            ),
            settingsItem(
              title: "Language",
              endWidget: Row(
                children: [
                  Text(
                    "English",
                    style: AppText.h3?.copyWith(color: AppColors.greyColor),
                  ),
                  Space.xf(.3),
                  arrowIcon()
                ],
              ),
            ),
            settingsItem(
              withDivider: false,
              title: "Region",
              endWidget: Row(
                children: [
                  Text(
                    "Kuwait",
                    style: AppText.h3?.copyWith(color: AppColors.greyColor),
                  ),
                  Space.xf(.2),
                  arrowIcon()
                ],
              ),
            ),
            Space.yf(2),
            Text(
              "About",
              style: AppText.h3b,
            ),
            Space.yf(1.2),
            ...buildSettingsItems(context),
            Space.y1!,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < AppStrings.socialUrls.length; i++)
                  Padding(
                    padding: Space.hf(.3),
                    child: GestureDetector(
                      onTap: () async {
                        await UrlFunctions.openUrl(AppStrings.socialUrls[i]);
                      },
                      child: SvgPicture.asset(AppAssets.socialAssets[i]),
                    ),
                  ),
              ],
            ),
            Space.y!,
            Align(
              alignment: Alignment.center,
              child: Text(
                "v 1.0.0",
                style: AppText.b1b,
              ),
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
            Space.yf(),
          ],
        ),
      ),
    );
  }
}


