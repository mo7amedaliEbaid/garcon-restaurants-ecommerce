import 'package:flutter/material.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/models/models.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.hf(1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.yf(1.5),
          Center(
            child: Text(
              restaurant.name.capitalize(),
              style: AppText.h2b,
            ),
          ),
          Space.yf(.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "( ",
                style: AppText.h3?.copyWith(color: AppColors.deepRed),
              ),
              ...restaurant.tags.map(
                (tag) => Padding(
                  padding: Space.hf(0.05),
                  child: Text(
                    "$tag,".capitalize(),
                    style: AppText.h3?.copyWith(color: AppColors.deepRed),
                  ),
                ),
              ),
              Text(
                " )",
                style: AppText.h3?.copyWith(color: AppColors.deepRed),
              ),
            ],
          ),
          Space.yf(1.5),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: AppDimensions.normalize(7),
              ),
              Space.xf(.2),
              Text(
                "Location",
                style: AppText.h2b,
              ),
            ],
          ),
          Space.yf(),
          ...restaurant.branches.map(
            (branch) => Container(
              width: double.infinity,
              padding: Space.all(.5, .3),
              margin: EdgeInsets.only(bottom: AppDimensions.normalize(4)),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey),
                  borderRadius:
                      BorderRadius.circular(AppDimensions.normalize(3))),
              child: Row(
                children: [
                  Text(
                    branch.toString().capitalize(),
                    style: AppText.b1b,
                  ),
                  const Text(" - Block- 2, St. 56, Floor 16")
                ],
              ),
            ),
          ),
          Space.yf(1.2),
          Row(
            children: [
              Icon(
                Icons.timelapse,
                size: AppDimensions.normalize(7),
              ),
              Space.xf(.2),
              Text(
                "Working Hours",
                style: AppText.h2b,
              ),
            ],
          ),
          Space.yf(),
        ],
      ),
    );
  }
}
