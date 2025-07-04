import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/data/models/setting_item_model.dart';
import 'package:prize/features/setting/view/widget/points_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingItemModel> generalSettingsItems = [
      SettingItemModel(
          imagePath: AppSvgs.moonSettingChangeModeIcon, title: "Mode"),
      SettingItemModel(
          imagePath: AppSvgs.lockSettingChangePasswordIcon,
          title: "Change Password"),
      SettingItemModel(
          imagePath: AppSvgs.notificationBingSettingsIcon,
          title: "Notification"),
      SettingItemModel(
          imagePath: AppSvgs.changeLanguageIcon, title: "Language"),
      SettingItemModel(imagePath: AppSvgs.ordersIcon, title: "My Orders"),
      SettingItemModel(
          imagePath: AppSvgs.locationSettingIcon, title: "My Address"),
      SettingItemModel(imagePath: AppSvgs.wallet, title: "My Wallet"),
    ];

    List<SettingItemModel> infoSettingsItems = [
      SettingItemModel(
          imagePath: AppSvgs.callContactUsSettingIcon, title: "Contact us"),
      SettingItemModel(
          imagePath: AppSvgs.callContactUsSettingIcon,
          title: "Customer Support"),
      SettingItemModel(imagePath: AppSvgs.messageQuestion, title: "FAQs"),
      SettingItemModel(imagePath: AppSvgs.blogIcon, title: "Blog"),
      SettingItemModel(imagePath: AppSvgs.infoCircle, title: "About"),
    ];

    List<SettingItemModel> policySettingsItems = [
      SettingItemModel(
          imagePath: AppSvgs.documentText, title: "Privacy Policy"),
      SettingItemModel(
          imagePath: AppSvgs.documentText, title: "Terms and Condition"),
      SettingItemModel(
          imagePath: AppSvgs.documentText, title: "Warranty Policy"),
      SettingItemModel(
          imagePath: AppSvgs.documentText, title: "Return and Exchange"),
    ];

    List<SettingItemModel> becimeAsellerItems = [
      SettingItemModel(imagePath: AppSvgs.userTag, title: "Become a Seller"),
    ];
    List<SettingItemModel> accountSettingsItems = [
      SettingItemModel(imagePath: AppSvgs.logout, title: "Logout"),
      SettingItemModel(imagePath: AppSvgs.trash, title: "Delete Account"),
    ];

    List<List<SettingItemModel>> groupedItems = [
      generalSettingsItems,
      infoSettingsItems,
      policySettingsItems,
      becimeAsellerItems,
      accountSettingsItems,
    ];

    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Setting",
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            verticalSpace(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: PointsWidget(),
            ),
            verticalSpace(10),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: groupedItems.length,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(thickness: 1, height: 1),
                ),
                itemBuilder: (context, groupIndex) {
                  final group = groupedItems[groupIndex];
                  return Column(
                    children: group
                        .map((item) => ListTile(
                              title: Text(
                                item.title,
                                style: AppTextStyles
                                    .meduimHead16w500TitleTextStyle(context),
                              ),
                              leading: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: groupIndex == 3
                                      ? AppColors.darkModeTanOrange
                                      : AppColors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: SvgPicture.asset(item.imagePath),
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
