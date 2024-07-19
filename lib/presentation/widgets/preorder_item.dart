import "package:flutter/material.dart";
import "package:garcon/models/models.dart";
import "package:garcon/core/core.dart";
import "package:garcon/configs/configs.dart";

Widget preOrderItem({required PickupsOrder pickupsOrder}) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        padding: Space.all(1, 1),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(
            AppDimensions.normalize(6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                preOrderColumn(
                  isStart: true,
                  topText: "Order Date:",
                  bottomText: "${pickupsOrder.date} ${pickupsOrder.time}",
                ),
                preOrderColumn(
                  isStart: false,
                  topText: "Name:",
                  bottomText:
                      pickupsOrder.name == "" ? "Unknown" : pickupsOrder.name,
                ),
              ],
            ),
            Space.yf(.7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                preOrderColumn(
                  isStart: true,
                  topText: "No of Items:",
                  bottomText: pickupsOrder.itemsNumber,
                ),
                preOrderColumn(
                  isStart: false,
                  topText: "Price:",
                  bottomText: pickupsOrder.amount,
                ),
              ],
            ),
            Space.yf(.7),
            Text(
              pickupsOrder.restaurant.toString().capitalize(),
              style: AppText.h2b,
            ),
            Space.yf(.3),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: AppDimensions.normalize(7),
                ),
                Text(
                  pickupsOrder.branch.toString().capitalize(),
                  style: AppText.b1,
                ),
              ],
            )
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          padding: Space.all(1.2, .4),
          decoration: BoxDecoration(
              color: AppColors.deepRed,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  AppDimensions.normalize(6),
                ),
                bottomRight: Radius.circular(
                  AppDimensions.normalize(6),
                ),
              )),
          child: Text(
            "Pending",
            style: AppText.b1b?.copyWith(color: Colors.white),
          ),
        ),
      )
    ],
  );
}

Widget preOrderColumn({
  required String topText,
  required String bottomText,
  required bool isStart,
}) {
  return Column(
    crossAxisAlignment:
        isStart ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: [
      Text(
        topText,
        style: AppText.b2b,
      ),
      Text(
        bottomText,
        style: AppText.b1b?.copyWith(color: AppColors.deepRed),
      )
    ],
  );
}
