import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/complete_profile/wishlist/view/widgets/create_wishlist_widget.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/profile/view/screen/sport_wishlist_on_profile_screen.dart';

class CreateWishlistFromProfileScreen extends StatelessWidget {
  const CreateWishlistFromProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.complete_profile_create_wishlist_widget_appbar_title
            .tr(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: CreateWishlistWidget(
                nextButton: AppSubmitButton(
                  onTap: () {
                    pushTo(context, SportWishlistOnProfileScreen());
                  },
                  title: LocaleKeys.complete_profile_next_create_wishlist
                      .tr()
                      .tr(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
