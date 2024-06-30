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

Widget pickupCachedNetworkImage(String image) {
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

Widget reservationAmountColumn(String amount) {
  return Column(
    children: [
      Space.yf(1.5),
      Text(
        "Reservation Amount",
        style: AppText.h2b,
      ),
      Space.yf(.5),
      Text(
        "$amount KWD",
        style: AppText.h1b?.copyWith(color: AppColors.deepRed),
      ),
      Space.yf(2),
    ],
  );
}

Widget bookingFooter() {
  return Column(
    children: [
      Space.yf(1.8),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error,
            color: AppColors.deepRed,
          ),
          Space.xf(.5),
          SizedBox(
            width: AppDimensions.normalize(115),
            child: const Text(
              "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est eopksio laborum.",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    ],
  );
}
