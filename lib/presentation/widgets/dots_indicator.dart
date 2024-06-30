import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/constants/colors.dart';

Widget dotsIndicator(
    {int? dotsIndex,
    required int dotsCount,
    required Color activeColor,
    required Color color}) {
  return DotsIndicator(
    dotsCount: dotsCount,
    position: dotsIndex!,
    decorator: DotsDecorator(
        color: color,
        activeColor: activeColor,
        spacing: Space.hf(.1),
        //    activeSizes: List.filled(4, Size.fromRadius(AppDimensions.normalize(3))),
        size: Size.fromRadius(
          AppDimensions.normalize(1.2),
        ),
        activeSize: Size.fromRadius(AppDimensions.normalize(2.6))),
  );
}
