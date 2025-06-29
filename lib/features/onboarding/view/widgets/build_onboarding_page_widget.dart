import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

import 'package:prize/features/onboarding/data/models/onboarding_page_data_model.dart';

class BuildOnboardingPageWidget extends StatelessWidget {
  const BuildOnboardingPageWidget({
    super.key,
    required this.pageData,
    required this.controller,
    required this.pagescount,
  });
  final OnboardingPageDataModel pageData;

  final PageController controller;
  final int pagescount;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            width: 550.w,
            height: 550.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(pageData.image), fit: BoxFit.fitHeight)),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r),
              ),
              color: AppWidgetColor.fillWidgetColor(context),
            ),
            constraints: BoxConstraints(
              maxHeight: height / 2.8,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300.w),
                      child: FittedBox(
                        child: Text(
                          pageData.title,
                          maxLines: 1,
                          style:
                              AppTextStyles.headTitle24w600TextStyle(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 350.w),
                      child: Text(
                        maxLines: 3,
                        pageData.description,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyTitle18w400TextStyle(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
