import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

class ShowProductPriceWidget extends StatelessWidget {
  const ShowProductPriceWidget({
    super.key,
    required this.newPrice,
    this.oldPrice,
  });

  final String newPrice;
  final String? oldPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 50.h),
        child: Row(
          children: [
            SvgPicture.asset(AppSvgs.currency),
            horizontalSpace(2),
            Text(
              newPrice,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.lighterOrange,
              ),
            ),
            if (oldPrice != null && oldPrice!.isNotEmpty) ...[
              horizontalSpace(4),
              SvgPicture.asset(
                AppSvgs.currency,
                width: 16.w,
                height: 16.h,
                color: const Color(0xFFB7BFD9),
              ),
              horizontalSpace(2),
              Text(
                oldPrice!,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0xFFB7BFD9),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
