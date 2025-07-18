import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';

class StateClaimed extends StatelessWidget {
  const StateClaimed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Color(0xffe9f2ef),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        LocaleKeys.point_screen_used.tr(),
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff56a36b),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
