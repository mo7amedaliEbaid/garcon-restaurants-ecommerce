import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/configs.dart';
import '../../core/core.dart';

Widget chooseStack({
  required String title,
  required String curvedSvg,
  required String positionedSvg,
  required Color color,
  void Function()? onTap,
}) {
  return SizedBox(
    height: AppDimensions.normalize(112),
    child: Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          curvedSvg,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                positionedSvg,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              Space.xf(.6),
              Text(
                title,
                style: AppText.h1?.copyWith(
                    color: Colors.white, fontSize: AppDimensions.normalize(15)),
              ),
              Space.xf(.6),
              SvgPicture.asset(
                AppAssets.arrowForward,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              )
            ],
          ),
        )
      ],
    ),
  );
}
