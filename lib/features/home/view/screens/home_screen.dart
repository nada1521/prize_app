import 'package:flutter/material.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/features/home/view/widgets/appbar/app_bar_widget.dart';
import 'package:prize/features/home/view/widgets/best_gifts_for_grads/best_gifts_for_grads.dart';
import 'package:prize/features/home/view/widgets/birthday_gifts/birthday_gifts_widget.dart';
import 'package:prize/features/home/view/widgets/categories/categories_widget.dart';
import 'package:prize/features/home/view/widgets/create_wishlist_banar_widget.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/mothers_day_gifts_widget.dart';
import 'package:prize/features/home/view/widgets/other_events/other_events_widget.dart';
import 'package:prize/features/home/view/widgets/upcoming_events/upcoming_events_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverToBoxAdapter(child: CreateWishlistBanarWidget()),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverToBoxAdapter(
            child: UpcomingEventsWidget(),
          ),
          SliverToBoxAdapter(
            child: OtherEventsWidget(),
          ),
          SliverToBoxAdapter(
            child: CategoriesWidget(),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverToBoxAdapter(
            child: MothersDayGiftsWidget(),
          ),
          SliverToBoxAdapter(
            child: BestGiftsForGrads(),
          ),
          SliverToBoxAdapter(
            child: BirthdayGiftsWidget(),
          ),
        ],
      ),
    );
  }
}
