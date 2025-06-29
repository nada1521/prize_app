import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/widgets/customs/icon_box_container.dart';


/// A tappable row with an icon, title, optional subtitle, and optional selection indicator.
///
/// Use this widget for options that can be selected,
/// showing a radio-button style indicator on the right when `isSelected` is non-null.
class SelectableIconOption extends StatelessWidget {
  const SelectableIconOption({
    super.key,
    this.color,
    required this.title,
    required this.icon,
    this.subtitle,
    this.onTap,
    this.isSelected,
  });

  final Color? color;
  final IconData icon;
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSize.radius16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.padding16,
          vertical: AppSize.padding12,
        ),
        child: Row(
          spacing: AppSize.padding12,
          children: [
            IconBoxContainer(
              icon: icon,
              color: color,
            ),
            Text(
              title,
              style: context.styleTitleMedium.copyWith(
                fontWeight: isSelected == true ? FontWeight.bold : null,
              ),
            ),
            if (subtitle != null) ...[
              7.spaceHeight,
              Text(
                subtitle!,
                style: context.styleSubtitle14,
              ),
            ],
            if (isSelected == true) ...[
              const Spacer(),
              Icon(
                isSelected! ? Icons.check : Icons.clear,
                size: 27,
                color: context.colorPrimaryWhite,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
