import 'package:prize/core/routing/routers.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/routing/app_router.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/widgets/main/app_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.appBarTitle,
    this.subTitle,
    required this.description,
    this.onBack,
    this.backTitle,

    /// Additional CTA button above back button.
    this.button,
  });

  final String appBarTitle;
  final String? subTitle;
  final String description;
  final void Function()? onBack;
  final String? backTitle;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, _) {
        if (!canPop) {
          onBack != null ? onBack?.call() : _navigate(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.padding50,
            vertical: AppSize.padding32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.happyNewsSvg),
              if (subTitle != null) ...[
                AppSize.padding16.spaceHeight,
                Text(
                  subTitle!,
                  style: context.styleTitleLargeBold.copyWith(
                    color: AppColors.secondaryViolet,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              AppSize.padding16.spaceHeight,
              Text(
                description,
                style: context.styleTitleLarge,
                textAlign: TextAlign.center,
              ),
              AppSize.padding50.spaceHeight,
              if (button != null) ...[
                button!,
                AppSize.padding12.spaceHeight,
              ],
              AppButton(
                title: backTitle ?? LocaleKeys.common_navigation_back_home.tr(),
                outlined: true,
                onPressed: onBack ??
                    () {
                      _navigate(context);
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigate(BuildContext context) {
    context.pushNamedFinish(AppRoutes.tabs);
  }
}
