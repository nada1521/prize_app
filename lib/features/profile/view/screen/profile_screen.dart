import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/profile/view/widgets/profile_info_widget.dart';
import 'package:prize/features/profile/view/widgets/show_all_user_events.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkModeTanOrange,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 85.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: AppWidgetColor.fillBackgroundColor(context),
                  borderRadius: BorderRadius.circular(48.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppSvgs.pointsIcon,
                        width: 30.w,
                        height: 30.h,
                      ),
                      horizontalSpace(3),
                      Text(
                        "200",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          foreground: Paint()
                            ..shader = LinearGradient(
                              colors: [
                                Color(0xFFFF6A00),
                                Color(0xFFFFB347),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(
                              Rect.fromLTWH(0, 0, 200, 100),
                            ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AppCircularIconButton(
              iconPath: AppSvgs.settingIcon,
              onTap: () {},
            ),
          ],
        ),
      ),
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
