import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/helper/navigation/push_replacement.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_enable_button.dart';
import 'package:prize/features/home/view/screens/home_screen.dart';

class YourProfileCompletedSuccessfullyPopUpWidget extends StatelessWidget {
  const YourProfileCompletedSuccessfullyPopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.successImage,
          width: 120.w,
          height: 120.h,
        ),
        verticalSpace(10),
        Text(
          'Your profile has been completed successfully.',
          style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpace(10),
        AppFillBckgroundButton(
            onTap: () {
              pushReplacement(context, HomeScreen());
            },
            title: 'start your journey')
      ],
    );
  }
}
