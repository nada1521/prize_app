import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/constant/app_urls.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/orders/views/screens/my_orders_screen.dart';
import 'package:prize/features/setting/point/view/screen/point_screen.dart';
import 'package:prize/features/setting/about/views/screens/about_screen.dart';
import 'package:prize/features/setting/blog/view/screens/blog_screen.dart';
import 'package:prize/features/setting/change_password/views/screens/change_password_screen.dart';
import 'package:prize/features/setting/contact_us/view/screens/contact_us_screens.dart';
import 'package:prize/features/setting/data/models/setting_item_model.dart';
import 'package:prize/features/setting/notifications/views/screens/notifications_screen.dart';
import 'package:prize/features/setting/policy/screens/privacy_policy_screen.dart';
import 'package:prize/features/setting/policy/screens/return_and_exchange_screen.dart';
import 'package:prize/features/setting/policy/screens/terms_and_conditions_screen.dart';
import 'package:prize/features/setting/policy/screens/warranty_policy_screen.dart';
import 'package:prize/features/setting/help_center/view/screens/help_center_screen.dart';
import 'package:prize/features/setting/view/widget/change_language_button.dart';
import 'package:prize/features/setting/view/widget/change_theme_button.dart';
import 'package:prize/features/setting/view/widget/points_widget.dart';
import 'package:prize/features/wallet/view/screen/wallet_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: LocaleKeys.setting_screen_general_settings_items_mode.tr(),
        isDarkModeButton: true,
      ),
      SettingItemModel(
        imagePath: AppSvgs.lockSettingChangePasswordIcon,
        title: LocaleKeys.setting_screen_general_settings_items_change_password
            .tr(),
        onTap: () => pushTo(
          context,
          ChangePasswordScreen(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.notificationBingSettingsIcon,
        title: LocaleKeys.core_notification.tr(),
        onTap: () => pushTo(
          context,
          NotificationsScreen(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.changeLanguageIcon,
        title: LocaleKeys.setting_screen_general_settings_items_language.tr(),
        isChangeLanguageButton: true,
      ),
      SettingItemModel(
        imagePath: AppSvgs.ordersIcon,
        title: LocaleKeys.core_my_orders.tr(),
        onTap: () => pushTo(
          context,
          MyOrdersScreen(),
        ),
      ),
      SettingItemModel(
          imagePath: AppSvgs.locationSettingIcon,
          title:
              LocaleKeys.setting_screen_general_settings_items_my_address.tr()),
      SettingItemModel(
          onTap: () {
            pushTo(context, PointScreen());
          },
          imagePath: AppSvgs.wallet,
          title:
              LocaleKeys.setting_screen_general_settings_items_my_wallet.tr(),
                onTap: () => pushTo(
          context,
          WalletScreen(),
        ),),
        
    ];

    List<SettingItemModel> infoSettingsItems = [
      SettingItemModel(
        imagePath: AppSvgs.callContactUsSettingIcon,
        title: LocaleKeys.setting_screen_info_settings_items_contact_us.tr(),
        onTap: () => pushTo(
          context,
          ContactUsScreens(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.callContactUsSettingIcon,
        title: LocaleKeys
            .setting_screen_info_settings_items_customer_support_customer_support
            .tr(),
        onTap: () => pushTo(
          context,
          HelpCenterScreen(),
        ),
      ),
      SettingItemModel(
          imagePath: AppSvgs.messageQuestion,
          title: LocaleKeys.setting_screen_info_settings_items_faqs.tr()),
      SettingItemModel(
        imagePath: AppSvgs.blogIcon,
        title: LocaleKeys.setting_screen_info_settings_items_blog.tr(),
        onTap: () => pushTo(
          context,
          BlogScreen(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.infoCircle,
        title: LocaleKeys.setting_screen_info_settings_items_about.tr(),
        onTap: () => pushTo(
          context,
          AboutScreen(),
        ),
      ),
    ];
    List<SettingItemModel> policySettingsItems = [
      SettingItemModel(
        imagePath: AppSvgs.documentText,
        title:
            LocaleKeys.setting_screen_policy_settings_items_privacy_policy.tr(),
        onTap: () => pushTo(
          context,
          PrivacyPolicyScreen(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.documentText,
        title: LocaleKeys
            .setting_screen_policy_settings_items_terms_and_condition_terms_and_condition
            .tr(),
        onTap: () => pushTo(
          context,
          TermsAndConditionsScreen(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.documentText,
        title: LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_warranty_policy
            .tr(),
        onTap: () => pushTo(
          context,
          WarrantyPolicyScreen(),
        ),
      ),
      SettingItemModel(
        imagePath: AppSvgs.documentText,
        title: LocaleKeys
            .setting_screen_policy_settings_items_return_and_exchange_return_and_exchange
            .tr(),
        onTap: () => pushTo(
          context,
          ReturnAndExchangeScreen(),
        ),
      ),
    ];

    List<SettingItemModel> becimeAsellerItems = [
      SettingItemModel(
          imagePath: AppSvgs.userTag,
          title: LocaleKeys.setting_screen_policy_settings_items_become_a_Seller
              .tr(),
          onTap: () async {
            final Uri url = Uri.parse(AppUrls.becameAsellerUrl(context));
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              debugPrint('Could not launch $url');
            }
          }),
    ];
    List<SettingItemModel> accountSettingsItems = [
      SettingItemModel(
          imagePath: AppSvgs.logout,
          title: LocaleKeys.setting_screen_policy_settings_items_logout.tr()),
      SettingItemModel(
          imagePath: AppSvgs.trash,
          title: LocaleKeys.setting_screen_policy_settings_items_delete_account
              .tr()),
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
        title: LocaleKeys.setting_screen_screen_name.tr(),
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
