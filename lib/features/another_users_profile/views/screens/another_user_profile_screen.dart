import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_back_button.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/app_outline_icon_button.dart';
import 'package:prize/features/home/view/widgets/user_avatar_widget.dart';
import 'package:prize/features/profile/view/widgets/personal_sizes.dart';
import 'package:prize/features/profile/view/widgets/show_all_user_events.dart';
import 'package:prize/features/profile/view/widgets/user_info_widget.dart';
import 'package:share_plus/share_plus.dart';

class AnotherUserProfileScreen extends StatelessWidget {
  const AnotherUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: screensPadding,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserAvatarWidget(
                        width: 80.w,
                        height: 80.h,
                      ),
                      horizontalSpace(12),
                      UserInfoWidget(
                        textColor: AppColors.secondDarkBlue,
                      )
                    ],
                  ),
                  verticalSpace(15),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: AppFillBckgroundButton(
                          height: 50.h,
                          width: 300.w,
                          onTap: () {},
                          title: LocaleKeys.another_user_profile_screen_follow
                              .tr(),
                          icon: SvgPicture.asset(AppSvgs.userAdd),
                        ),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        flex: 0,
                        child: AppOutlineIconButton(
                          height: 50.h,
                          width: 50.w,
                          onTap: () {
                            Share.share("text");
                          },
                          icon:
                              SvgPicture.asset(AppSvgs.shareProfileIconButton),
                          color: AppColors.orangeTanHide,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 50.h,
                      maxWidth: 150.w,
                    ),
                    child: Text(
                      "FCIS ... CS Dept✌🏻 UI/UX Designer",
                      maxLines: 2,
                      style: AppTextStyles
                          .meduimBody16W500BlackAndWhiteTitleTextStyle(context),
                    ),
                  ),
                  verticalSpace(18),
                  PersonalSizes(
                    textColor: AppColors.orangeTanHide,
                    backGroundColor: AppColors.orangeTanHide.withOpacity(.06),
                  ),
                  verticalSpace(10),
                  Container(
                    width: 350.w,
                    height: 56.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: AppColors.blueColor.withOpacity(.08),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.blueColor.withOpacity(.08),
                          width: 2,
                        )),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppSvgs.calendarProfileCommingEvent),
                        horizontalSpace(10),
                        Text(
                          LocaleKeys.profile_screen_birthday.tr(),
                          style: AppTextStyles.headTitle24w600TextStyle(context)
                              .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blueColor,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 100.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            color: AppWidgetColor.fillBackgroundColor(context),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    end: 5.w, start: 5.w),
                                child: SvgPicture.asset(
                                  AppSvgs.clock,
                                  width: 14.w,
                                  height: 14.h,
                                ),
                              ),
                              FittedBox(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      end: 5.w, start: 5.w),
                                  child: Text(
                                      "7 ${LocaleKeys.home_upcomming_events_events_title_days.tr()}"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
