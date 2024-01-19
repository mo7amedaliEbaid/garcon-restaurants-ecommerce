import 'package:flutter/material.dart';

import 'package:garcon/configs/configs.dart';
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

  @override
  void initState() {
    _pageController = PageController(initialPage: selectedPageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: widget.restaurant.name),
      body: Column(
        children: [
          Space.yf(1.3),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
