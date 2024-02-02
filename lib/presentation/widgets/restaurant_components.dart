import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';

Widget positionedItem({
  required String svgPicture,
  required String value,
}) {
  return Container(
    height: AppDimensions.normalize(10),
    width: AppDimensions.normalize(22),
    decoration: BoxDecoration(
      color: AppColors.deepRed,
      borderRadius: BorderRadius.circular(
        AppDimensions.normalize(5),
      ),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPicture,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: AppDimensions.normalize(4.3),
          ),
          Space.xf(.2),
          Text(
            value,
            style: AppText.l1?.copyWith(
              color: Colors.white,
            ),
          )
        ],
      ),
    ),
  );
}

Widget pickupCachedNetworkImage(String image){
  return CachedNetworkImage(
    imageUrl: image,
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
  );
}