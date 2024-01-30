import 'package:flutter/material.dart';
import 'package:garcon/models/models.dart';

import '../../configs/configs.dart';
import '../../core/core.dart';

class PickUpsView extends StatefulWidget {
  const PickUpsView({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  State<PickUpsView> createState() => _PickUpsViewState();
}

class _PickUpsViewState extends State<PickUpsView> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppDimensions.normalize(4.5),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < widget.restaurant.categories.length; i++)
              GestureDetector(
                onTap: () => setState(() => selectedCategoryIndex = i),
                child: Column(
                  children: [
                    Row(
                      children: [
                        /*   SvgPicture.asset(AppAssets.restaurantTaps[i],
                                  colorFilter: ColorFilter.mode(
                                    selectedCategoryIndex == i
                                        ? AppColors.deepRed
                                        : Colors.black,
                                    BlendMode.srcIn,
                                  )),
                              Space.xf(.4),*/
                        Text(
                          widget.restaurant.categories[i],
                          style: AppText.h3b?.copyWith(
                            color: selectedCategoryIndex == i
                                ? AppColors.deepRed
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                    AnimatedContainer(
                      height: AppDimensions.normalize(1.5),
                      width: AppDimensions.normalize(40),
                      margin: EdgeInsets.only(
                        top: AppDimensions.normalize(4),
                      ),
                      duration: const Duration(milliseconds: 200),
                      color: selectedCategoryIndex == i
                          ? AppColors.deepRed
                          : Colors.white,
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
