import 'package:easy_localization/easy_localization.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_theme_text_styles.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.upcoming_outlined,
            size: 80,
            color: AppColors.grey,
          ),
          const SizedBox(height: 5),
          Text(
            title ?? LocaleKeys.common_no_items.tr(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.semiBoldFontStyle(context).copyWith(
              fontSize: 16,
              color: AppColors.titleBodyLight,
            ),
          ),
        ],
      ),
    );
  }
}
