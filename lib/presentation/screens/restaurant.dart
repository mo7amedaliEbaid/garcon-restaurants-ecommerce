import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/models/models.dart';
import 'package:garcon/presentation/widgets.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  PageController _pageController = PageController();
  int selectedPageIndex = 1;
  int selectedTapIndex = 0;
  int selectedCategoryIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: selectedPageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: widget.restaurant.name,
      ),
      body: Column(
        children: [
          Space.yf(),
          Stack(
            children: [
              SizedBox(
                height: AppDimensions.normalize(100),
                width: double.infinity,
                child: PageView.builder(
                    itemCount: 4,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedPageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return restaurantCachedNetworkImage(
                          widget.restaurant.image);
                    }),
              ),
              Positioned(
                bottom: AppDimensions.normalize(4),
                left: 0,
                right: 0,
                child: dotsIndicator(
                  dotsCount: 4,
                  activeColor: Colors.red,
                  dotsIndex: _pageController.hasClients
                      ? _pageController.page?.round()
                      : 1,
                  color: Colors.white.withOpacity(.7),
                ),
              ),
              Positioned(
                bottom: AppDimensions.normalize(4),
                right: AppDimensions.normalize(28),
                child: positionedItem(
                  svgPicture: AppAssets.eyeAlt,
                  value: widget.restaurant.views,
                ),
              ),
              Positioned(
                bottom: AppDimensions.normalize(4),
                right: AppDimensions.normalize(4),
                child: positionedItem(
                  svgPicture: AppAssets.book,
                  value: widget.restaurant.reviews,
                ),
              )
            ],
          ),
          Material(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.only(
                top: AppDimensions.normalize(4.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < 3; i++)
                    GestureDetector(
                      onTap: () => setState(() => selectedTapIndex = i),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.restaurantTaps[i],
                                  colorFilter: ColorFilter.mode(
                                    selectedTapIndex == i
                                        ? AppColors.deepRed
                                        : Colors.black,
                                    BlendMode.srcIn,
                                  )),
                              Space.xf(.4),
                              Text(
                                AppStrings.restaurantTaps[i],
                                style: AppText.h3b?.copyWith(
                                  color: selectedTapIndex == i
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
                            color: selectedTapIndex == i
                                ? AppColors.deepRed
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppDimensions.normalize(4.5),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < 5; i++)
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
                                AppStrings.restaurantCategories[i],
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
          ),
        ],
      ),
    );
  }
}
