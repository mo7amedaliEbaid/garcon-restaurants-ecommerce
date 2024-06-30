import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/presentation/widgets/home_components.dart';

Widget verticalRestaurantItem(Restaurant restaurant, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .pushNamed(AppRouter.restaurant, arguments: restaurant);
    },
    child: Container(
      clipBehavior: Clip.hardEdge,
      margin: Space.all(1.3, .5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.normalize(8))),
      child: Stack(
        children: [
          restaurantCachedNetworkImage(restaurant.image),
          Positioned(
              top: AppDimensions.normalize(8),
              right: AppDimensions.normalize(8),
              child: Column(
                children: [
                  reviewsRow(svgUrl: AppAssets.eyeAlt, text: restaurant.views),
                  Space.yf(.3),
                  reviewsRow(svgUrl: AppAssets.book, text: restaurant.reviews),
                ],
              )),
          Positioned(
              bottom: AppDimensions.normalize(5),
              left: AppDimensions.normalize(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name.capitalize(),
                    style: AppText.h2b?.copyWith(
                        color: Colors.white, backgroundColor: Colors.grey),
                  ),
                  Space.yf(.2),
                  restaurantTagsRow(
                      tags: restaurant.tags,
                      svgColor: Colors.white,
                      textStyle: AppText.b1b!.copyWith(
                        color: Colors.white,
                        height: 1,
                      ))
                ],
              ))
        ],
      ),
    ),
  );
}

Widget reviewsRow({required String svgUrl, required String text}) {
  return Row(
    children: [
      SvgPicture.asset(
        svgUrl,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      Space.xf(.5),
      Text(
        text,
        style: AppText.b1b?.copyWith(color: Colors.white),
      )
    ],
  );
}
