<<<<<<< HEAD

=======
>>>>>>> 1140b940fa691cbec04c71b8e0b6a9406c8c6bbf
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

import 'package:prize/core/utils/resources/app_widget_color.dart';


class CustomThemeSwitchWidget extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  const CustomThemeSwitchWidget({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Widget darkModeChangeThemeToDarkIcon = Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: SvgPicture.asset(
        height: 20.h,
        AppSvgs.darkModeChangeThemeToDark,
        color: isDarkMode ? AppColors.darkModeTanOrange : AppColors.grey,
      ),
    );
    final Widget lightkModeChangeThemeToDarkIcon = Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Icon(
        Icons.wb_sunny,
        color: isDarkMode ? AppColors.gray : AppColors.darkModeTanOrange,
        size: 18.h,
      ),
    );
    return GestureDetector(
      onTap: () => onChanged(!isDarkMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 90.w,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: darkModeChangeThemeToDarkIcon),
                  Center(child: lightkModeChangeThemeToDarkIcon),
                ],
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 100),
              alignment:
                  isDarkMode ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.darkModeTanOrange.withOpacity(0.2)
                      : AppColors.darkModeTanOrange.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
