import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/app_disable_button.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/dialog/base/pop_up_dialog.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
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
          BuildProductGrid(
            itemCard: productsWithoutOffer,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppFillBckgroundButton(
              onTap: () {},
<<<<<<< HEAD
              title: LocaleKeys
                  .complete_profile_sport_wishlist_add_items_to_wishlist
                  .tr(),
=======
              title: LocaleKeys.complete_profile_add_items_to_wishlist.tr(),
>>>>>>> f63e81cddb8679c6e6aa12a8fc4c9eee60f18ce5
            ),
            verticalSpace(10),
            AppOutLineButton(
              onTap: () {
                showPopup(
                    context, YourProfileCompletedSuccessfullyPopUpWidget());
              },
<<<<<<< HEAD
              title: LocaleKeys.complete_profile_sport_wishlist_save_and_confirm
=======
              title: LocaleKeys
                  .complete_profile_create_wishlist_widget_save_and_Confirm
>>>>>>> f63e81cddb8679c6e6aa12a8fc4c9eee60f18ce5
                  .tr(),
            ),
          ],
        ),
      ),
    );
  }
}
