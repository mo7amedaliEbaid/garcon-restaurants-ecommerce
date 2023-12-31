import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppDimensions.normalize(35)),
        child: Padding(
          padding: EdgeInsets.only(
              top: AppDimensions.normalize(23),
              left: AppDimensions.normalize(8),
              right: AppDimensions.normalize(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppAssets.logoText,
                colorFilter:
                    const ColorFilter.mode(AppColors.darkRed, BlendMode.srcIn),
              ),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.filter),
                  Space.xf(.7),
                  SvgPicture.asset(AppAssets.search),
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Space.all(1.4, .5),
            child: Text(
              "Trending Restaurants",
              style: AppText.h2b?.copyWith(color: AppColors.darkPurple),
            ),
          ),
          SizedBox(
            height: AppDimensions.normalize(100),
            child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
              builder: (context, state) {
                if (state is RestaurantsLoaded &&
                    state.restaurants.isNotEmpty) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.restaurants.length,
                    padding: Space.hf(1.2),
                    itemBuilder: (context, index) {
                      return restaurantItem(state.restaurants[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Space.xf();
                    },
                  );
                } else if (state is RestaurantsLoaded &&
                    state.restaurants.isEmpty) {
                  return Center(
                    child: Text(
                      "There is no restaurants available",
                      style: AppText.h3b,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.deepRed,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
