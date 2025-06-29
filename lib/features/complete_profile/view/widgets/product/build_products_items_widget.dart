import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/data/models/category_model.dart';
import 'package:prize/features/complete_profile/view/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildProductsItemsWidget extends StatelessWidget {
  BuildProductsItemsWidget({super.key});
  final List<CategoryModel> categorys = [
    CategoryModel(titel: 'Special Offers'),
    CategoryModel(titel: 'Flash sale'),
    CategoryModel(titel: 'New Arri'),
    CategoryModel(titel: 'Special Offers'),
    CategoryModel(titel: 'New Arri'),
  ];
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 50.h,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(17.r),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: SvgPicture.asset(
                    color: AppWidgetColor.fillWithContrastColor(context),
                    AppSvgs.setting,
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          ...categorys.map((category) => CategoryWidget(category: category)),
        ],
      ),
    );
  }
}
