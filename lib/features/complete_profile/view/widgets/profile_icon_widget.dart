import 'package:prize/core/constant/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration:
                  GlobalAppWidgetsStyles.appCircleBoxDecoration(context),
              child: SvgPicture.asset(
                AppSvgs.userAvatar,
                fit: BoxFit.none,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 34.w,
                height: 34.h,
                decoration: BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  AppSvgs.edit,
                  fit: BoxFit.none,
                ),
              ),
            )
          ],
        ),
        Text('Abdelrhmna Ali'),
      ],
    );
  }
}
