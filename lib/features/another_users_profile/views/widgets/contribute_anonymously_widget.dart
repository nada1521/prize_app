import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class ContributeAnonymouslyWidget extends StatefulWidget {
  const ContributeAnonymouslyWidget({super.key});

  @override
  State<ContributeAnonymouslyWidget> createState() =>
      _ContributeAnonymouslyWidgetState();
}

class _ContributeAnonymouslyWidgetState
    extends State<ContributeAnonymouslyWidget> {
  bool contributeAnonymously = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LocaleKeys.contribute_the_gift_screen_contribute_anonymously.tr(),
          style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
        ),
        Spacer(),
        Switch(
          activeColor: AppColors.white,
          activeTrackColor: AppColors.darkModeTanOrange,
          inactiveThumbColor: AppColors.darkModeTanOrange,
          inactiveTrackColor:
              AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          onChanged: (s) {
            setState(() {
              contributeAnonymously = s;
            });
          },
          value: contributeAnonymously,
        ),
      ],
    );
  }
}
