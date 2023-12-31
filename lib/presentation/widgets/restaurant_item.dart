import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/models/restaurant.dart';

Widget restaurantItem(Restaurant restaurant) {
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
        child: CachedNetworkImage(
          imageUrl: restaurant.image,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return Image.asset(
              AppAssets.placeHolder,
              fit: BoxFit.cover,
            );
          },
          placeholder: (context, url) {
            return Image.asset(
              AppAssets.placeHolder,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
      Space.yf(.3),
      Text(
        restaurant.name.capitalize(),
        style: AppText.h3b,
      ),
      Space.yf(.35),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppAssets.restaurant,
            height: AppDimensions.normalize(4),
            colorFilter:
                const ColorFilter.mode(AppColors.darkPurple, BlendMode.srcIn),
          ),
          Space.xf(.4),
          ...restaurant.tags.asMap().entries.map((entry) {
            //To make the last item end with a space instead of a comma,
            final index = entry.key;
            final tag = entry.value;
            final isLast = index == restaurant.tags.length - 1;

            return Text(
              "$tag${isLast ? ' ' : ', '}".capitalize(),
              style: AppText.b1?.copyWith(height: 1),
            );
          })
        ],
      )
    ],
  );
}
