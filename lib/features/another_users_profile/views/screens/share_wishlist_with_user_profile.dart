import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:prize/features/another_users_profile/data/product_wishlist_product_progress_model.dart';
import 'package:prize/features/another_users_profile/views/widgets/product_wishlist_progress_widget.dart';
import 'package:prize/features/home/view/widgets/user_avatar_widget.dart';
import 'package:prize/features/profile/view/widgets/user_info_widget.dart';
import 'package:share_plus/share_plus.dart';

class ShareWishlistWithUserProfile extends StatelessWidget {
  const ShareWishlistWithUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductWishlistProductProgressModel> products = [
      ProductWishlistProductProgressModel(
          product: productsWitOffer[0],
          precent: .6,
          eventDate: DateTime(2025, 7, 24),
          contributors: [
            ContributorsModel(
                contributorName: "Abdo",
                contributorProfileUrl:
                    "https://cdn.pixabay.com/photo/2021/12/22/01/41/man-6886497_960_720.jpg")
          ],
          eventName: "Abdelrahman Birthday 🎂",
          
          ),
      ProductWishlistProductProgressModel(
          product: productsWitOffer[0],
          precent: .3,
          eventDate: DateTime(2025, 7, 24),
          contributors: [
            ContributorsModel(
                contributorName: "Mohamed",
                contributorProfileUrl:
                    "https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_960_720.jpg")
          ],
          
                    eventName: "Abdelrahman Birthday 🎂",

          ),
      ProductWishlistProductProgressModel(
          product: productsWitOffer[0],
          precent: .3,
          eventDate: DateTime(2025, 7, 24),
          contributors: [
            ContributorsModel(
                contributorName: "Ahmed",
                contributorProfileUrl:
                    "https://cdn.pixabay.com/photo/2020/04/08/07/15/coffee-5016043_1280.jpg")
          ],
          
                    eventName: "Abdelrahman Birthday 🎂",

          )
    ];
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
                          icon: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: SvgPicture.asset(
                              AppSvgs.shareProfileIconButton,
                              color: AppColors.orangeTanHide,
                            ),
                          ),
                          // color: AppColors.orangeTanHide,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(15),
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
            child: verticalSpace(5),
          ),
          SliverGrid.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(end: 5.w),
              child: ProductWishlistProgressWidget(
                product: products[index],
              ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: .7),
          )
        ],
      ),
    );
  }
}
