
import 'package:prize/features/home/view/screens/home_screen.dart';
// import 'package:prize/features/home/view/screens/home_screen.dart';
import 'package:prize/features/tabs/view/cubit/tabs_cubit.dart';
import 'package:prize/features/tabs/view/widgets/bottom_bar.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      /// Home
      CustomBottomBarItem(
        icon: CustomBottomBarIcon(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home),
        ),
        screen: const HomeScreen(),
        title: LocaleKeys.common_navigation_home_screen.tr(),
      ),

      // /// My Properties
      // CustomBottomBarItem(
      //   title: LocaleKeys.common_navigation_my_props.tr(),
      //   icon: CustomBottomBarIcon(
      //     icon: const Icon(Icons.home_work_outlined),
      //     activeIcon: const Icon(Icons.home_work),
      //   ),
      //   screen: const HomeScreen(),
      // ),
      //
      // /// Search
      // CustomBottomBarItem(
      //   title: LocaleKeys.common_navigation_marketing.tr(),
      //   icon: CustomBottomBarIcon(
      //     icon: const Icon(Icons.campaign_outlined),
      //     activeIcon: const Icon(Icons.campaign_rounded),
      //   ),
      //   screen: const HomeScreen(),
      // ),

      /// Settings
      // CustomBottomBarItem(
      //   title: LocaleKeys.common_navigation_settings.tr(),
      //   icon: CustomBottomBarIcon(
      //     icon: const Icon(Icons.settings_outlined),
      //     activeIcon: const Icon(Icons.settings),
      //   ),
      //   screen: HomePopScope(
      //     child: const SettingsScreen(),
      //   ),
      // ),
    ];

    return BlocBuilder<TabsCubit, int>(
      builder: (context, index) {
        return Scaffold(
          body: items[index].screen,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          bottomNavigationBar: CustomBottomBar(
            currentIndex: index,
            onTap: (i) => context.read<TabsCubit>().updateIndex(i),
            items: items,
          ),
        );
      },
      buildWhen: (p, c) => c >= 0,
    );
  }
}
