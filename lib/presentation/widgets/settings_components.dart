import 'package:flutter/material.dart';
import '../../configs/configs.dart';
import '../../core/core.dart';

Widget arrowIcon() {
  return Icon(
    Icons.arrow_forward_ios,
    color: AppColors.greyColor,
    size: AppDimensions.normalize(7),
  );
}

List<Widget> buildSettingsItems(BuildContext context) {
  return List.generate(AppStrings.aboutTapsStrings.length, (index) {
    return settingsItem(
      title: AppStrings.aboutTapsStrings[index],
      endWidget: arrowIcon(),
      onTap: () {
        Navigator.of(context).pushNamed(AppRouter.aboutTaps[index]);
      },
    );
  });
}

Widget settingsItem(
    {required String title,
    required Widget endWidget,
    void Function()? onTap,
    bool withDivider = true}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppText.h3?.copyWith(color: AppColors.greyColor),
            ),
            endWidget
          ],
        ),
      ),
      Space.yf(.3),
      withDivider
          ? const Divider(
              color: AppColors.lightGrey,
            )
          : const SizedBox.shrink(),
      Space.yf(.3),
    ],
  );
}
Widget verseText({required String text}) {
  return Padding(
    padding: Space.h1!,
    child: Text(
      text,
      style: AppText.b2!.copyWith(
        color: AppColors.greyColor,
      ),
    ),
  );
}