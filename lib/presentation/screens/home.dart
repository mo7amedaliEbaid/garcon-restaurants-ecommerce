import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int selectedPageIndex = 1;

  @override
  void initState() {
    _pageController = PageController(initialPage: selectedPageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            trendingTitle(),
            SizedBox(
              height: AppDimensions.normalize(97),
              child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
                builder: (context, state) {
                  if (state is RestaurantsLoaded &&
                      state.restaurants.isNotEmpty) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.restaurants.length,
                      padding: Space.hf(1.2),
                      itemBuilder: (context, index) {
                        return horizontalRestaurantItem(
                            state.restaurants[index], context);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Space.xf();
                      },
                    );
                  } else if (state is RestaurantsLoaded &&
                      state.restaurants.isEmpty) {
                    return noRestaurantsState();
                  } else {
                    return loadingState();
                  }
                },
              ),
            ),
            restaurantsTitle(),
            BlocBuilder<RestaurantsBloc, RestaurantsState>(
              builder: (context, state) {
                if (state is RestaurantsLoaded &&
                    state.restaurants.isNotEmpty) {
                  return Column(
                    children: [
                      ...state.restaurants.map((restaurant) =>
                          verticalRestaurantItem(restaurant, context))
                    ],
                  );
                } else if (state is RestaurantsLoaded &&
                    state.restaurants.isEmpty) {
                  return noRestaurantsState();
                } else {
                  return loadingState();
                }
              },
            ),
            Space.yf(.6),
            SizedBox(
              height: AppDimensions.normalize(130),
              child: PageView.builder(
                  itemCount: 4,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedPageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Space.hf(1.3),
                      child: Image.asset(
                        AppAssets.ad,
                        fit: BoxFit.fill,
                      ),
                    );
                  }),
            ),
            Space.yf(.6),
            Center(
              child: dotsIndicator(
                dotsIndex: _pageController.hasClients
                    ? _pageController.page?.round()
                    : 1,
                dotsCount: 4,
                activeColor: AppColors.darkRed.withOpacity(.7),
                color: AppColors.darkRed.withOpacity(.2),
              ),
            ),
            Space.yf()
          ],
        ),
      ),
    );
  }
}
