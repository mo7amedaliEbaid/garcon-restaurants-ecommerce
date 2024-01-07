import 'package:flutter/material.dart';
import 'package:garcon/core/core.dart';

import '../../configs/configs.dart';

Future<void> filterBottomSheet(BuildContext context) async {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.normalize(10)),
    ),
    clipBehavior: Clip.hardEdge,
    isDismissible: false,
    constraints: BoxConstraints(
      maxHeight: AppDimensions.normalize(255),
    ),
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 1.5,
              child: SizedBox(
                height: AppDimensions.normalize(22),
                width: double.infinity,
                child: Padding(
                  padding: Space.hf(.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Space.xf(3),
                      Text(
                        "Filters",
                        style: AppText.h3b,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: AppColors.deepRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: Space.hf(1.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Space.yf(), restaurantTypeText()],
              ),
            )
          ],
        ),
      );
    },
  );
}

Widget restaurantTypeText() {
  return Text(
    "Restaurant Type",
    style: AppText.h2b,
  );
}
