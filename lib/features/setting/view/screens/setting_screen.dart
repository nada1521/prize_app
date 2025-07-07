import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/common/languages.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/about/views/screens/about_screen.dart';
import 'package:prize/features/setting/change_password/views/screens/change_password_screen.dart';
import 'package:prize/features/setting/contact_us/view/screens/contact_us_screens.dart';
import 'package:prize/features/setting/data/models/setting_item_model.dart';
import 'package:prize/features/setting/notifications/views/screens/notifications_screen.dart';
import 'package:prize/features/setting/policy/screens/privacy_policy_screen.dart';
import 'package:prize/features/setting/view/widget/change_language_button.dart';
import 'package:prize/features/setting/view/widget/change_theme_button.dart';
import 'package:prize/features/setting/view/widget/custom_theme_switch_button_widget.dart';
import 'package:prize/features/setting/view/widget/points_widget.dart';
import 'package:prize/features/theme/bloc/theme_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    List<SettingItemModel> generalSettingsItems = [
      SettingItemModel(
        imagePath: AppSvgs.moonSettingChangeModeIcon,
        title: "Mode",
        isDarkModeButton: true,
      ),
      SettingItemModel(
        imagePath: AppSvgs.lockSettingChangePasswordIcon,
        title: "Change Password",
        onTap: () => pushTo(
          context,
          ChangePasswordScreen(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.notificationBingSettingsIcon,
        title: "Notification",
        onTap: () => pushTo(
          context,
          NotificationsScreen(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.changeLanguageIcon,
        title: "Language",
        isChangeLanguageButton: true,
      ),
      SettingItemModel(imagePath: AppSvgs.ordersIcon, title: "My Orders"),
      SettingItemModel(
          imagePath: AppSvgs.locationSettingIcon, title: "My Address"),
      SettingItemModel(imagePath: AppSvgs.wallet, title: "My Wallet"),
    ];

    List<SettingItemModel> infoSettingsItems = [
      SettingItemModel(
        imagePath: AppSvgs.callContactUsSettingIcon,
        title: "Contact us",
        onTap: () => pushTo(
          context,
          ContactUsScreens(),
        ),
      ),
      SettingItemModel(
          imagePath: AppSvgs.callContactUsSettingIcon,
          title: "Customer Support"),
      SettingItemModel(imagePath: AppSvgs.messageQuestion, title: "FAQs"),
      SettingItemModel(imagePath: AppSvgs.blogIcon, title: "Blog"),
      SettingItemModel(
        imagePath: AppSvgs.infoCircle,
        title: "About",
        onTap: () => pushTo(
          context,
          AboutScreen(),
        ),
      ),
    ];

    List<SettingItemModel> policySettingsItems = [
      SettingItemModel(
        imagePath: AppSvgs.documentText,
        title: "Privacy Policy",
        onTap: () => pushTo(
          context,
          PrivacyPolicyScreen(),
        ),
      ),
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
                        .map(
                          (item) => ListTile(
                            title: InkWell(
                              onTap: item.onTap,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: AppTextStyles
                                        .meduimHead16w500TitleTextStyle(
                                            context),
                                  ),
                                  Spacer(),
                                  if (item.isChangeLanguageButton == true)
                                    ChangeLanguageButton(),
                                  if (item.isDarkModeButton != null)
                                    ChangeThemeButton(),
                                  item.isDarkModeButton == null
                                      ? GlobalAppWidgetsStyles
                                          .settingArrowWidget(context)
                                      : SizedBox.shrink()
                                ],
                              ),
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
                          ),
                        )
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
