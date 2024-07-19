import 'package:flutter_svg/svg.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/configs/configs.dart';
import "package:flutter/material.dart";

Widget emptyScreen({
  required String text,
  required String svg,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Space.yf(9),
      SvgPicture.asset(
        svg,
        colorFilter: const ColorFilter.mode(
          AppColors.deepRed,
          BlendMode.srcIn,
        ),
      ),
      Space.y1!,
      Center(
        child: Text(
          text,
          style: AppText.b1b,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
