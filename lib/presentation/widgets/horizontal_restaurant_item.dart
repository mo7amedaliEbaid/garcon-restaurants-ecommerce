import 'package:flutter/material.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/presentation/widgets/widgets.dart';

Widget horizontalRestaurantItem(Restaurant restaurant) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          height: AppDimensions.normalize(68),
          width: AppDimensions.normalize(94),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimensions.normalize(6),
            ),
          ),
          child: restaurantCachedNetworkImage(restaurant.image)),
      Space.yf(.3),
      Text(
        restaurant.name.capitalize(),
        style: AppText.h3b,
      ),
      Space.yf(.35),
      restaurantTagsRow(
          tags: restaurant.tags,
          svgColor: AppColors.darkPurple,
          textStyle: AppText.b1!.copyWith(height: 1))
    ],
  );
}
