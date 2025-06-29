import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget
 extends StatelessWidget {
  const CategoryWidget
  ({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Center(
          child: Text(category.titel,
              style:
                  AppTextStyles.smallBodyTitle12w400WithContrastColorTextStyle(
                          context)
                      .copyWith(
                fontSize: 14,
              )),
        ),
      ),
    );
  }
}
