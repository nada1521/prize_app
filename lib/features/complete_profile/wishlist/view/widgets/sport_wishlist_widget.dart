
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/app_disable_button.dart';
import 'package:prize/core/widgets/app_enable_button.dart';
import 'package:prize/core/widgets/dialog/base/pop_up_dialog.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_grid.dart';
import 'package:flutter/material.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/your_profile_completed_successfully_pop_up_widget.dart';


class SportWishlistWidget extends StatelessWidget {
  const SportWishlistWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(child: EmptySportWishlistWidget()),
          BuildProductGrid(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppFillBckgroundButton(
              onTap: () {},
              title: '+ Add items to wishlist',
            ),
            verticalSpace(10),
            AppOutLineButton(
              onTap: () {
                showPopup(
                    context, YourProfileCompletedSuccessfullyPopUpWidget());
              },
              title: 'Save and Confirm',
            ),
          ],
        ),
      ),
    );
  }
}
