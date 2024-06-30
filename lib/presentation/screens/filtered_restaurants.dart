import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/space.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

class FilteredRestaurantsScreen extends StatelessWidget {
  const FilteredRestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectTagCubit, SelectTagState>(
      builder: (context, selectedState) {
        return Scaffold(
          appBar: customAppBar(
              context: context,
              title: (selectedState.selectedTag == null)
                  ? ""
                  : selectedState.selectedTag!.name.capitalize()),
          body: BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              if (state.filteredRestaurants.isEmpty) {
                return const Center(
                  child: Text("No Matches Found"),
                );
              } else {
                return ListView.builder(
                    padding: Space.v2,
                    itemCount: state.filteredRestaurants.length,
                    itemBuilder: (context, index) {
                      return verticalRestaurantItem(
                          state.filteredRestaurants[index], context);
                    });
              }
            },
          ),
        );
      },
    );
  }
}
