import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class SelectableLocationItem extends StatelessWidget {
  final bool isSelected;
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  const SelectableLocationItem({
    super.key,
    required this.isSelected,
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? AppColors.darkModeTanOrange
        : Colors.transparent;

    final border = isSelected
        ? null
        : GlobalAppWidgetsStyles.containerGrayBoxBorder(context);

    final textStyle = isSelected
        ? AppTextStyles.smallBodyTitle12w500WhiteOnlyTextStyle(context)
        : AppTextStyles.smallBodyTitle12w500BlackAndWhiteOnlyTextStyle(context);

    final iconColor = isSelected
        ? AppWidgetColor.backgroundColor(context)
        : AppWidgetColor.fillWithGrayAndDiColor(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30.r),
          border: border,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              color: iconColor,
            ),
            horizontalSpace(5),
            FittedBox(child: Text(label, style: textStyle)),
          ],
        ),
      ),
    );
  }
}
