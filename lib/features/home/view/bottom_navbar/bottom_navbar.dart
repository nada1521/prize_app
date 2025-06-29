import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/home/view/bottom_navbar/logic/bottom_nav_bar_navigator/bottom_nav_bar_navigator_cubit.dart';
import '../screens/home_screen.dart';
import 'bottom_navbar_icon_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> screens = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarNavigatorCubit, BottomNavBarNavigatorState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavBarNavigatorCubit>();

        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: cubit.goToIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.moreLighterDarkPeriwinkle,
            backgroundColor: AppWidgetColor.fillBackgroundColor(context),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: BottomNavbarIconWidget(
                  cuttentIndex: cubit.currentIndex,
                  selectedIndex: 0,
                  iconPath: AppSvgs.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: BottomNavbarIconWidget(
                  cuttentIndex: cubit.currentIndex,
                  selectedIndex: 1,
                  iconPath: AppSvgs.shop,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: BottomNavbarIconWidget(
                  cuttentIndex: cubit.currentIndex,
                  selectedIndex: 2,
                  iconPath: AppSvgs.cart,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: BottomNavbarIconWidget(
                  cuttentIndex: cubit.currentIndex,
                  selectedIndex: 3,
                  iconPath: AppSvgs.profile,
                ),
                label: 'Profile',
              ),
            ],
          ),
          body: screens[cubit.currentIndex],
        );
      },
    );
  }
}
