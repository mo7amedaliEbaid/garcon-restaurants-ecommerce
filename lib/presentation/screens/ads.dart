import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/presentation/widgets.dart';

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
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is Disconnected) {
          return Scaffold(
            backgroundColor: AppColors.darkRed,
            body: RefreshIndicator(
              key: _refreshIndicatorKey,
              backgroundColor: AppColors.deepRed,
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
                // Trigger the reconnection attempt when pulled down
                state.onTryAgain;
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Space.y1!,
                    SvgPicture.asset(
                      AppAssets.logo,
                      height: AppDimensions.normalize(60),
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    Space.yf(3.5),
                    Text(
                      "INTERNET CONNECTION\nFAILED",
                      style: AppText.h3b?.copyWith(height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    Space.yf(1.5),
                    SvgPicture.asset(
                      AppAssets.noInternet,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    Space.yf(5),
                    Text(
                      "Sorry! The application couldn't connect to\nour servers due to a connection error\nPlease, check your internet connection.",
                      style: AppText.b1b,
                      textAlign: TextAlign.center,
                    ),
                    Space.yf(3.5),
                    Padding(
                      padding: Space.hf(2),
                      child: customElevatedButton(
                          onPressed: () {
                            _refreshIndicatorKey.currentState?.show();
                          },
                          width: double.infinity,
                          height: AppDimensions.normalize(20),
                          color: Colors.black,
                          borderRadius: AppDimensions.normalize(4),
                          text: 'Try Again',
                          textStyle:
                              AppText.h3b!.copyWith(color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
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
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          if (state.status == AuthStatus.unauthenticated) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRouter.signIn,
                              (route) => false,
                            );
                          }

                          if (state.status == AuthStatus.authenticated) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRouter.choose,
                              (route) => false,
                            );
                          }
                        },
                        child: Container(
                          height: AppDimensions.normalize(16),
                          width: AppDimensions.normalize(38),
                          decoration: BoxDecoration(
                            color: AppColors.deepRed,
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(AppDimensions.normalize(4)),
                              bottomLeft:
                                  Radius.circular(AppDimensions.normalize(4)),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Skip",
                                  style:
                                      AppText.h3?.copyWith(color: Colors.white),
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
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
