import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
  });
  final Function() onPressed;
  final IconData icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 1.7),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.primary, size: 28),
      ),
    );
  }
}
