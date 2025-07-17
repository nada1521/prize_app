import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class BuildDateRowWidget extends StatelessWidget {
  const BuildDateRowWidget({
    super.key,
    required this.dateTitle,
    required this.date,
    required this.context,
  });

  final String dateTitle;
  final DateTime date;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$dateTitle: ",
          style: AppTextStyles.meduimBody16W500DarkAndLightThemeTitleTextStyle(
                  context)
              .copyWith(
            fontSize: 14,
          ),
        ),
        Text(
          DateFormat(AppConstants.dateFormatterPattern).format(date),
          style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(context),
        ),
      ],
    );
  }
}
