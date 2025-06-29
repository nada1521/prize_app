import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/widgets/main/app_button.dart';
import 'package:prize/core/widgets/main/app_circular_progress.dart';

class PaginationLoadingWidget extends StatelessWidget {
  const PaginationLoadingWidget({
    super.key,
    required this.isLoading,

    /// Pass this function in case that you cannot use the regular [ProgressIndicator],
    /// so if this function != null, that means the current widget returns [Button] instead of [ProgressIndicator],
    /// and when pressed on that button, this function executed.
    this.onPressedMoreButton,
  });

  final bool isLoading;
  final void Function()? onPressedMoreButton;

  @override
  Widget build(BuildContext context) {
    if (onPressedMoreButton != null && !isLoading) {
      return AppButton(
        onPressed: onPressedMoreButton!,
        title: LocaleKeys.action_show_more.tr(),
        color: AppColors.primaryLight8,
        onColor: AppColors.primary,
      );
    } else if (!isLoading) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(AppSize.padding12),
      child: AppCircularProgress(
        loading: isLoading,
        size: 23,
        strokeWidth: 3,
      ),
    );
  }
}
