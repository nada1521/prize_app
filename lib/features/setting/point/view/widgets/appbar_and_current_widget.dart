import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';

class AppBarAndCurrentPointWidget extends StatelessWidget {
  const AppBarAndCurrentPointWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: Stack(
        children: [
          SizedBox(
            height: 150.h,
            width: double.infinity,
            child: OrangeAppbarWidget(
              title: LocaleKeys.point_screen_point.tr(),
              showBackButton: true,
              height: 500.h,
            ),
          ),
          Positioned(
            top: 100.h,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.only(top: 20, bottom: 20),
              height: 100.h,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppSvgs.pointsIcon,
                    width: 30.w,
                    height: 30.h,
                  ),
                  Text(LocaleKeys.point_screen_current_points.tr(),
                      style: AppTextStyles
                              .headTitle14w500WhiteAndDarkBlueTextStyle(context)
                          .copyWith(color: Color(0xff5c5a72))),
                  Text(
                    "200",
                    style: AppTextStyles.headTitle24w600TextStyle(context)
                        .copyWith(fontSize: 28, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
