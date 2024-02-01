import 'package:flutter/material.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/presentation/widgets.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: Space.all(1, 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < widget.restaurant.categories.length; i++)
              Padding(
                padding: EdgeInsets.only(
                  right: AppDimensions.normalize(4),
                ),
                child: customElevatedButton(
                    width: AppDimensions.normalize(52),
                    height: AppDimensions.normalize(18),
                    color: selectedCategoryIndex == i
                        ? AppColors.deepRed
                        : AppColors.lightGrey,
                    borderRadius: AppDimensions.normalize(6),
                    text:
                        widget.restaurant.categories[i].toString().capitalize(),
                    textStyle: AppText.b2b!.copyWith(
                        color: selectedCategoryIndex == i
                            ? Colors.white
                            : Colors.black),
                    onPressed: () => setState(() => selectedCategoryIndex = i)),
              ),
          ],
        ),
      ),
    );
  }
}
