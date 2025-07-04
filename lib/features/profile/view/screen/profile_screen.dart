import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/wishlist/view/widgets/create_wishlist_widget.dart';
import 'package:prize/features/profile/view/screen/create_wishlist_from_profile_screen.dart';
import 'package:prize/features/profile/view/widgets/profile_info_widget.dart';
import 'package:prize/features/profile/view/widgets/show_all_user_events.dart';
import 'package:prize/features/profile/view/widgets/user_profile_appbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          pushTo(
              context,
             CreateWishlistFromProfileScreen());
        },
        child: Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.darkModeTanOrange,
          ),
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: AppColors.darkModeTanOrange,
          automaticallyImplyLeading: false,
          title: UserProfileAppbarWidget()),
      body: CustomScrollView(
        slivers: [
          ProfileInfoWidget(),
          SliverToBoxAdapter(
            child: verticalSpace(15),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ShowAllUserEvents(),
            ),
          )
        ],
      ),
    );
  }
}
