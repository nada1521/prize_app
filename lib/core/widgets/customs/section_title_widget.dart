import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.paddingDefault20,
        // vertical: onTap != null ? 0 : AppSize.paddingSmall12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              title,
              style: context.styleHeadline2,
              maxLines: 2,
            ),
          ),
          if (onTap != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(
                // bottom: AppSize.paddingExtraSmall,
                start: AppSize.paddingDefault20,
              ),
              child: TextButton(
                onPressed: onTap,
                child: Text(
                  LocaleKeys.common_show_all.tr(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
