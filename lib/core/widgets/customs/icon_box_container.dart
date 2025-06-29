import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_size.dart';

/// A circular (or rounded-rectangle) background box container for an icon.
///
/// Use this widget to wrap any [Icon] with consistent padding,
/// rounded corners, and a translucent background based on the given color.
class IconBoxContainer extends StatelessWidget {
  const IconBoxContainer({
    super.key,
    this.color,
    required this.icon,
  });

  final Color? color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.colorPrimaryWhite;

    return Container(
      padding: const EdgeInsets.all(AppSize.padding8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.11),
        borderRadius: BorderRadius.circular(AppSize.radius16),
      ),
      child: Icon(
        icon,
        color: color,
        size: 26,
      ),
    );
  }
}
