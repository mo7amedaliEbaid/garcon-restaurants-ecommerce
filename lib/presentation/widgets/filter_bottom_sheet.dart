import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

import '../../configs/configs.dart';

Future<void> filterBottomSheet(BuildContext context) async {
  bool isBooking = true;
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        AppDimensions.normalize(10),
      ),
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
              padding: Space.hf(1.7),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.yf(2),
                      filterSheetText("Restaurant Type"),
                      Space.yf(1.2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isBooking
                              ? customElevatedButton(
                                  width: AppDimensions.normalize(58),
                                  height: AppDimensions.normalize(18),
                                  color: AppColors.deepRed,
                                  borderRadius: AppDimensions.normalize(4),
                                  text: "Booking",
                                  textStyle: AppText.h3b!
                                      .copyWith(color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      isBooking = true;
                                    });
                                  })
                              : customOutlinedButton(
                                  width: AppDimensions.normalize(58),
                                  height: AppDimensions.normalize(18),
                                  borderColor: AppColors.deepRed,
                                  borderRadius: AppDimensions.normalize(4),
                                  text: "Booking",
                                  textStyle: AppText.h3b!
                                      .copyWith(color: AppColors.deepRed),
                                  onPressed: () {
                                    setState(() {
                                      isBooking = true;
                                    });
                                  },
                                ),
                          isBooking
                              ? customOutlinedButton(
                                  width: AppDimensions.normalize(58),
                                  height: AppDimensions.normalize(18),
                                  borderColor: AppColors.deepRed,
                                  borderRadius: AppDimensions.normalize(4),
                                  text: "Pickup",
                                  textStyle: AppText.h3b!
                                      .copyWith(color: AppColors.deepRed),
                                  onPressed: () {
                                    setState(() {
                                      isBooking = false;
                                    });
                                  })
                              : customElevatedButton(
                                  width: AppDimensions.normalize(58),
                                  height: AppDimensions.normalize(18),
                                  color: AppColors.deepRed,
                                  borderRadius: AppDimensions.normalize(4),
                                  text: "Pickup",
                                  textStyle: AppText.h3b!
                                      .copyWith(color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      isBooking = false;
                                    });
                                  })
                        ],
                      ),
                      Space.yf(2.2),
                      filterSheetText("Cuisine"),
                      Space.yf(),
                      BlocBuilder<TagsBloc, TagsState>(
                        builder: (context, state) {
                          if (state is TagsLoaded && state.tags.isNotEmpty) {
                            return SizedBox(
                              height: AppDimensions.normalize(110),
                              child: ListView.separated(
                                itemCount: state.tags.length,
                                itemBuilder: (context, index) {
                                  return filterItem(tag: state.tags[index]);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Space.yf(.5);
                                },
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      Space.yf(1.3),
                      bottomRow(context)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
