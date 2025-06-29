import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/widgets/customs/icon_box_container.dart';

/// A horizontal layout combining an icon background with a title and optional subtitle.
///
/// Use this when you need to show an icon alongside text,
/// such as in list items or settings screens.
class IconLabelRow extends StatelessWidget {
  const IconLabelRow({
    super.key,
    this.color,
    required this.title,
    required this.icon,
    this.subtitle,
  });

  final Color? color;
  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppSize.padding12,
      children: [
        IconBoxContainer(
          icon: icon,
          color: color,
        ),
        AppSize.padding8.spaceWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.styleTitleMedium,
              ),
              if (subtitle != null) ...[
                3.spaceHeight,
                Text(
                  subtitle!,
                  style: context.styleSubtitle14,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
