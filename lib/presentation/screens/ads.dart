import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/application/cubits/connectivity_cubit.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          if (state is Disconnected) {
            return RefreshIndicator(
              key: _refreshIndicatorKey,

              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
                // Trigger the reconnection attempt when pulled down
                state.onTryAgain;
              },
              child: Center(
                child: Column(
                  children: [
                    Text("Disconnected"),
                    ElevatedButton(onPressed: (){
                      // Manually trigger the RefreshIndicator when "Try Again" is tapped
                      _refreshIndicatorKey.currentState?.show();
                    }, child: Text("Try Again"))
                  ],
                ),
              ),
            );
          } else {
            return Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: AppStrings.ads,
                  errorWidget: (context, error, stackTrace) {
                    return Image.asset(AppAssets.splash);
                  },
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.deepRed,
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: AppDimensions.normalize(25),
                  right: 0,
                  child: Container(
                    height: AppDimensions.normalize(16),
                    width: AppDimensions.normalize(38),
                    decoration: BoxDecoration(
                      color: AppColors.deepRed,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.normalize(4)),
                        bottomLeft: Radius.circular(AppDimensions.normalize(4)),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Skip",
                            style: AppText.h3?.copyWith(color: Colors.white),
                          ),
                          Space.xf(.6),
                          SvgPicture.asset(
                            AppAssets.skip,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
