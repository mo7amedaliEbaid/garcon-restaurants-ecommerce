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
