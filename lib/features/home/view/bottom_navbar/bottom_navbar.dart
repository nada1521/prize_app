import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/home/view/bottom_navbar/logic/bottom_nav_bar_navigator/bottom_nav_bar_navigator_cubit.dart';
import 'package:prize/features/shop/views/screens/shop_products_screen.dart';
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
    ShopProductsScreen(),
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
                label: LocaleKeys.nav_title_home_title.tr(),
              ),
              BottomNavigationBarItem(
                  icon: BottomNavbarIconWidget(
                    cuttentIndex: cubit.currentIndex,
                    selectedIndex: 1,
                    iconPath: AppSvgs.shop,
                  ),
                  label: LocaleKeys.nav_title_shop_title.tr()),
              BottomNavigationBarItem(
                icon: BottomNavbarIconWidget(
                  cuttentIndex: cubit.currentIndex,
                  selectedIndex: 2,
                  iconPath: AppSvgs.cart,
                ),
                label: LocaleKeys.nav_title_cart_title.tr(),
              ),
              BottomNavigationBarItem(
                icon: BottomNavbarIconWidget(
                  cuttentIndex: cubit.currentIndex,
                  selectedIndex: 3,
                  iconPath: AppSvgs.profile,
                ),
                label: LocaleKeys.nav_title_profil_title.tr(),
              ),
            ],
          ),
          body: screens[cubit.currentIndex],
        );
      },
    );
  }
}
