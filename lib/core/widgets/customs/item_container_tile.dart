import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/widgets/main/app_shadow.dart';
import 'package:prize/core/widgets/main/app_shimmer.dart';

/// A card-like tappable list item with optional leading icon or widget, title, subtitle, and chevron.
///
/// Use this for list entries that navigate or trigger actions,
/// with consistent padding, shadow, and background color.
class ItemContainerTile extends StatelessWidget {
  const ItemContainerTile({
    super.key,
    required this.title,
    this.icon,
    this.leading,
    this.subtitle,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSize.paddingLarge26,
    ),
    this.bgColor = Colors.white,
  }) : assert(!(icon != null && leading != null),
            'icon and leading cannot be used together');

  final String title;
  final IconData? icon;
  final Widget? leading;
  final String? subtitle;
  final void Function()? onTap;
  final EdgeInsets padding;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSize.radius20),
        splashColor: AppColors.primaryLight5.withValues(alpha: 0.04),
        highlightColor: AppColors.surfaceBox.withValues(alpha: 0.15),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingLarge26,
            vertical: AppSize.paddingDefault20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.radius20),
            color: bgColor,
            boxShadow: const [
              AppShadow(),
            ],
          ),
          child: Row(
            spacing: AppSize.paddingDefault20,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: AppColors.neutralLight,
                  size: 28,
                ),
              if (leading != null) leading!,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.styleTitleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitle?.isNotEmpty == true) ...[
                      7.spaceHeight,
                      Text(
                        subtitle!,
                        style: context.styleSubtitle14,
                      ),
                    ],
                  ],
                ),
              ),
              if (onTap != null)
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.neutralLight,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingItemContainer extends StatelessWidget {
  const LoadingItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppSize.padding32,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.radius20),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 75,
      ),
    );
  }
}
