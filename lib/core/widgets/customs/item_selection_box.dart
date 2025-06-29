import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:flutter/material.dart';

class ItemSelectionBox extends StatelessWidget {
  const ItemSelectionBox({
    super.key,
    this.icon,
    required this.title,
    this.color = AppColors.primary,
    required this.isSelected,
    this.onTap,
  });

  final IconData? icon;
  final String title;
  final Color color;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.padding12,
          vertical: AppSize.padding5,
        ),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.07) : null,
          borderRadius: BorderRadius.circular(AppSize.radius6),
          border: isSelected
              ? null
              : Border.all(
                  width: 1,
                  color: color,
                ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 14,
                color: color,
              ),
              const SizedBox(width: AppSize.padding5),
            ],
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
