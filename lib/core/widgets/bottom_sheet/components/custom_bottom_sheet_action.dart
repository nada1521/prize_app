import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/utils/resources/app_theme_text_styles.dart';
import 'package:prize/core/widgets/bottom_sheet/components/app_bottom_sheet_drag_widget.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetAction extends StatelessWidget {
  const CustomBottomSheetAction({
    super.key,
    required this.title,
    required this.button,
    this.subTitle,
    this.showCancel = true,
    this.cancelTitle,
  });

  final String title;
  final String? subTitle;
  final Widget button;
  final bool showCancel;
  final String? cancelTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBottomSheetDragWidget(),
          Text(
            title,
            style: context.styleHeadline1,
            textAlign: TextAlign.center,
          ),
          if (subTitle?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.paddingDefault20,
              ),
              child: Text(
                subTitle!,
                style: Theme.of(context).textTheme.mediumFontStyle(context),
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: AppSize.padding32),
          // button
          button,
          // cancel
          if (showCancel)
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.padding16,
                bottom: AppSize.paddingDefault20,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  cancelTitle ?? LocaleKeys.action_cancel.tr(),
                  style: context.styleBodyLarge.copyWith(
                    color: context.colorPrimaryWhite,
                  ),
                ),
              ),
            ),
          const SizedBox(height: AppSize.padding16),
        ],
      ),
    );
  }
}
