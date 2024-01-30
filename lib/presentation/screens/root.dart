import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garcon/configs/configs.dart';
import 'package:garcon/core/core.dart';
import 'package:garcon/presentation/screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    HomeScreen(),
    AccountScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.home),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              AppAssets.home,
              colorFilter:
                  const ColorFilter.mode(AppColors.deepRed, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.reservations),
            label: 'Reservations',
            activeIcon: SvgPicture.asset(
              AppAssets.reservations,
              colorFilter:
                  const ColorFilter.mode(AppColors.deepRed, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.account),
            label: 'Account',
            activeIcon: SvgPicture.asset(
              AppAssets.account,
              colorFilter:
                  const ColorFilter.mode(AppColors.deepRed, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.settings),
            label: 'Settings',
            activeIcon: SvgPicture.asset(
              AppAssets.settings,
              colorFilter:
                  const ColorFilter.mode(AppColors.deepRed, BlendMode.srcIn),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: AppText.b1,
        selectedItemColor: AppColors.deepRed,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
