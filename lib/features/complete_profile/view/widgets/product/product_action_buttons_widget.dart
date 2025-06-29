import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

class ProductActionsWidget extends StatelessWidget {
  const ProductActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(
          iconPath: AppSvgs.heart,
          iconColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.moreDarkPeriwinkle
              : AppColors.white,
        ),
        horizontalSpace(10),
        _buildActionButton(
          iconPath: AppSvgs.trash,
          iconColor: AppColors.lighterOrange,
        ),
      ],
    );
  }

  Widget _buildActionButton({required String iconPath, required Color iconColor}) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.grey,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          iconPath,
          color: iconColor,
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}
