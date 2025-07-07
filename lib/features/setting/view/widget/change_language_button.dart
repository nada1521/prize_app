import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/common/languages.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: InkWell(
        onTap: () async {
          final currentLocale = context.locale.languageCode;
          final newLocale =
              currentLocale == 'en' ? const Locale('ar') : const Locale('en');
          await Language.changeLanguage(context, locale: newLocale);
        },
        child: Text(
          context.locale.languageCode == 'en' ? 'English' : 'العربية',
          style: AppTextStyles.bodyTitle18w400darkPeriwinkleTextStyle(context)
              .copyWith(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
