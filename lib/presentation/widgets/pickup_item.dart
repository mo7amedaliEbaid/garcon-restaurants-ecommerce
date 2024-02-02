import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:garcon/core/constants/colors.dart';
import 'package:garcon/core/extensions/extensions.dart';
import 'package:garcon/models/pickup.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';

Widget pickupItem({required PickUp pickUp}) {
  return Stack(
    children: [
      Container(
        height: AppDimensions.normalize(45),
        padding: Space.all(.5, .5),
        margin: EdgeInsets.only(
          bottom: AppDimensions.normalize(5),
          right: AppDimensions.normalize(5),
          left: AppDimensions.normalize(5),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(
            AppDimensions.normalize(4),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
                width: AppDimensions.normalize(50),
                child: pickupCachedNetworkImage(pickUp.image)),
            Space.xf(.7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pickUp.name.capitalize(),
                  style: AppText.b1b,
                ),
                Space.yf(.2),
                SizedBox(
                  width: AppDimensions.normalize(75),
                  child: Text(
                    pickUp.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.l1b,
                  ),
                ),
                Space.yf(.4),
                Text(
                  "${pickUp.price} KWD",
                  style: AppText.b1b,
                )
              ],
            )
          ],
        ),
      ),
      Positioned(
        right: AppDimensions.normalize(5),
        child: Container(
          height: AppDimensions.normalize(10),
          width: AppDimensions.normalize(15),
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                AppDimensions.normalize(4),
              ),
              bottomLeft: Radius.circular(
                AppDimensions.normalize(4),
              ),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}
