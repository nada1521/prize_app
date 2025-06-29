import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_text_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      width: 350.w,
      height: 48.h,
      child: AppTextFormField(
        fillColor: AppWidgetColor.fillWidgetByLightBackgroundColor(context)
            .withOpacity(.1),
        hintText: 'Search',
        validator: (s) {},
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          child: SvgPicture.asset(AppSvgs.searchNormal),
        ),
        hintStyle:
            AppTextStyles.meduimBody16W500TitleTextStyle(context).copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: context.isDarkTheme
              ? AppColors.periwinkle.withOpacity(.8)
              : AppColors.primaryWhite,
        ),
      ),
    );
  }
}
