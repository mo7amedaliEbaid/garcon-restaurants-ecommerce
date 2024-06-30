import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../configs/configs.dart';
import '../../core/core.dart';

PreferredSizeWidget homeAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, AppDimensions.normalize(35)),
    child: Padding(
      padding: EdgeInsets.only(
        top: AppDimensions.normalize(23),
        left: AppDimensions.normalize(8),
        right: AppDimensions.normalize(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppAssets.logoText,
            colorFilter:
                const ColorFilter.mode(AppColors.darkRed, BlendMode.srcIn),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await filterBottomSheet(context);
                },
                child: SvgPicture.asset(AppAssets.filter),
              ),
              Space.xf(.7),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRouter.search);
                  },
                  child: SvgPicture.asset(AppAssets.search)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget trendingTitle() {
  return Padding(
    padding: Space.all(1.4, .5),
    child: Text(
      "Trending Restaurants",
      style: AppText.h2b?.copyWith(color: AppColors.darkPurple),
    ),
  );
}

Widget noRestaurantsState() {
  return Center(
    child: Text(
      "There is no restaurants available",
      style: AppText.h3b,
    ),
  );
}

Widget loadingState() {
  return const Center(
    child: CircularProgressIndicator(
      color: AppColors.deepRed,
    ),
  );
}

Widget restaurantsTitle() {
  return Padding(
    padding: Space.hf(1.2),
    child: Text(
      "Restaurants",
      style: AppText.h2b,
    ),
  );
}

Widget restaurantCachedNetworkImage(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
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

Widget restaurantTagsRow(
    {required List<dynamic> tags,
    required Color svgColor,
    required TextStyle textStyle}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        AppAssets.restaurant,
        height: AppDimensions.normalize(4),
        colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
      ),
      Space.xf(.4),
      ...tags.asMap().entries.map((entry) {
        //To make the last item end with a space instead of a comma,
        final index = entry.key;
        final tag = entry.value;
        final isLast = index == tags.length - 1;

        return Text(
          "$tag${isLast ? ' ' : ', '}".capitalize(),
          style: textStyle,
        );
      })
    ],
  );
}
