import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/application/application.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/screens.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<NavigationCubit, NavigationTab>(
          builder: (context, activeTab) {
            switch (activeTab) {
              case NavigationTab.homeTab:
                return const HomeScreen();
              case NavigationTab.reservationTap:
                return const ReservationScreen();
              case NavigationTab.accountTap:
                return const AccountScreen();
              case NavigationTab.settingsTab:
                return const SettingsScreen();

              default:
                return const HomeScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationTab>(
        builder: (context, activeTab) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.home),
                label: 'Home',
                activeIcon: SvgPicture.asset(
                  AppAssets.home,
                  colorFilter: const ColorFilter.mode(
                      AppColors.deepRed, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.reservations),
                label: 'Reservations',
                activeIcon: SvgPicture.asset(
                  AppAssets.reservations,
                  colorFilter: const ColorFilter.mode(
                      AppColors.deepRed, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.account),
                label: 'Account',
                activeIcon: SvgPicture.asset(
                  AppAssets.account,
                  colorFilter: const ColorFilter.mode(
                      AppColors.deepRed, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.settings),
                label: 'Settings',
                activeIcon: SvgPicture.asset(
                  AppAssets.settings,
                  colorFilter: const ColorFilter.mode(
                      AppColors.deepRed, BlendMode.srcIn),
                ),
              ),
            ],
            currentIndex: activeTab.index,
            selectedLabelStyle: AppText.b1,
            selectedItemColor: AppColors.deepRed,
            showUnselectedLabels: false,
            onTap: (index) {
              final newTab = NavigationTab.values[index];
              context.read<NavigationCubit>().updateTab(newTab);
            },
          );
        },
      ),
    );
  }
}
