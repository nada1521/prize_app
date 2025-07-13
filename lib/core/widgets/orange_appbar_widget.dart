import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_colors.dart' show AppColors;
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class OrangeAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const OrangeAppbarWidget({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackTap,
    this.suffixIcon,
    this.height,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final double? height;
  final Widget? suffixIcon;

  @override
  Size get preferredSize => Size.fromHeight(height ?? 90.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height ?? 90.h),
      child: Container(
        constraints: BoxConstraints(maxHeight: 90.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        color: AppWidgetColor.fillWidgetWithOrangeAndDarkColor(context),
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
          child: Row(
            children: [
              // Back button (optional)
              if (showBackButton)
                AppCircularIconButton(
                  iconPath: AppSvgs.arrowLeft,
                  onTap: onBackTap ?? () => Navigator.of(context).maybePop(),
                ),
              horizontalSpace(10),

              // Title (centered with Expanded)
              Container(
                constraints: BoxConstraints(
                  maxWidth: 200.w,
                ),
                child: FittedBox(
                  child: Text(
                    title,
                    style: AppTextStyles.headTitle24w600TextStyle(context)
                        .copyWith(
                      fontSize: 18,
                      color: AppColors.primaryWhite,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              if (suffixIcon != null) Spacer(),

              // Suffix icon (optional)
              if (suffixIcon != null) suffixIcon!
            ],
          ),
        ),
      ),
    );
  }
}
