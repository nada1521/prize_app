import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';

class NotifcationScreen extends StatelessWidget {
  const NotifcationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title:
            LocaleKeys.core_notification.tr(),
        showBackButton: true,
      ),
      body: Center(
        child: Padding(
          padding: screensPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 100.w, maxHeight: 100.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.outline,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: SvgPicture.asset(
                    AppSvgs.emptyCart,
                  ),
                ),
              ),
              verticalSpace(15),
              Text(
                LocaleKeys.setting_screen_general_settings_items_no_notification
                    .tr(),
                style: AppTextStyles.bodyTitle18w400TextStyle(context).copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
