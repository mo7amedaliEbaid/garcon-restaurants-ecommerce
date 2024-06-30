import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/app_dimensions.dart';
import 'package:garcon/configs/app_typography.dart';
import 'package:garcon/configs/space.dart';
import 'package:garcon/presentation/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: ""),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<RestaurantsBloc, RestaurantsState>(
              builder: (context, state) {
                if (state is RestaurantsLoaded) {
                  return Padding(
                    padding: Space.all(1.5, 1.5),
                    child: customTextField(
                      labelText: "Type Here",
                      onChanged: (value) {
                        context
                            .read<SearchCubit>()
                            .searchByName(state.restaurants, value);
                      },
                      controller: _searchController,
                      prefix: Padding(
                        padding: Space.h!,
                        child: Icon(
                          Icons.search,
                          size: AppDimensions.normalize(12),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Error On Loading Restaurants",
                      style: AppText.h3b,
                    ),
                  );
                }
              },
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccessState &&
                    state.searchedRestaurants.isNotEmpty &&
                    _searchController.text.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: Space.hf(1.5),
                        child: Text(
                          "${state.searchedRestaurants.length} Results Found",
                          style: AppText.h3,
                        ),
                      ),
                      Space.y1!,
                      ...state.searchedRestaurants.map((restaurant) =>
                          verticalRestaurantItem(restaurant, context))
                    ],
                  );
                } else {
                   return Padding(
                     padding: Space.hf(1.5),
                     child: Text(
                      "No Result Found for \"${_searchController.text}\"",
                      style: AppText.h3,
                                       ),
                   );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
