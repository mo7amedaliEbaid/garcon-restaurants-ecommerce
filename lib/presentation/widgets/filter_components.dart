import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/presentation/widgets.dart';
import '../../application/application.dart';
import '../../models/models.dart';
import 'package:garcon/core/core.dart';

Widget filterSheetText(String filterSheetText) {
  return Text(
    filterSheetText,
    style: AppText.h2b,
  );
}

Widget filterItem({required Tag tag}) {
  return BlocBuilder<SelectTagCubit, SelectTagState>(
      builder: (context, selectedTagState) {
    return Container(
      padding: Space.hf(),
      height: AppDimensions.normalize(17),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.normalize(4)),
          border: Border.all(color: Colors.grey.shade400)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tag.name.capitalize()),
          BlocBuilder<RestaurantsBloc, RestaurantsState>(
            builder: (context, state) {
              if (state is RestaurantsLoaded && state.restaurants.isNotEmpty) {
                return Checkbox(
                    activeColor: AppColors.deepRed,
                    side: const BorderSide(color: AppColors.deepRed),
                    checkColor: Colors.white,
                    value: selectedTagState.selectedTag == tag,
                    onChanged: (value) {
                      context.read<SelectTagCubit>().toggleTag(tag);
                      context
                          .read<FilterCubit>()
                          .filterByTag(state.restaurants, tag.name);
                    });
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  });
}

Widget bottomRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customOutlinedButton(
          width: AppDimensions.normalize(45),
          height: AppDimensions.normalize(17),
          borderColor: AppColors.deepRed,
          borderRadius: AppDimensions.normalize(3),
          text: "Reset",
          textStyle: AppText.h3b!.copyWith(color: AppColors.deepRed),
          onPressed: () {
            context.read<SelectTagCubit>().clearSelection();
          }),
      customElevatedButton(
          width: AppDimensions.normalize(75),
          height: AppDimensions.normalize(17),
          color: AppColors.deepRed,
          borderRadius: AppDimensions.normalize(3),
          text: "Apply",
          textStyle: AppText.h3b!.copyWith(color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.filteredRestaurants);
          })
    ],
  );
}
