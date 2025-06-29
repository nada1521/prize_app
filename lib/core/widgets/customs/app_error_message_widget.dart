import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';

class AppErrorMessage extends StatelessWidget {
  const AppErrorMessage({
    super.key,
    required this.message,
    this.iconData = Icons.error_outline,
    this.button,
    this.icon,
  });

  final String? message;
  final Widget? button;
  final IconData iconData;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 100,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSize.padding12,
        children: [
          icon ??
              Icon(
                iconData,
                color: AppColors.grey,
                size: 48,
              ),
          Text(
            message?.isNotEmpty == true
                ? message!
                : LocaleKeys.common_errors_unexpected_error_occurred.tr(),
            textAlign: TextAlign.center,
          ),
          if (button != null) button!,
        ],
      ),
    );
  }
}
