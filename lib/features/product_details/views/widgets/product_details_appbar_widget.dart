import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class ProductDetailsAppbarWidget extends StatelessWidget {
  const ProductDetailsAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0,
      pinned: true,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: Container(
            constraints: BoxConstraints(
              maxHeight: 90.h,
            ),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            color: AppWidgetColor.fillWidgetWithOrangeAndDarkColor(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  spacing: 10.w,
                  children: [
                    AppCircularIconButton(
                      iconPath: AppSvgs.arrowLeft,
                      onTap: () => {},
                    ),
                    Text(
                      'Product Details',
                      style: AppTextStyles.headTitle24w600TextStyle(context)
                          .copyWith(
                              fontSize: 18, color: AppColors.primaryWhite),
                    ),
                    Spacer(),
                    AppCircularIconButton(
                      iconPath: AppSvgs.shareForward,
                      onTap: () => {},
                    ),
                  ],
                ),
              ],
            ),
            
            ),
      ),
    );
  }
}
