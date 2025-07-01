import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class BioWidget extends StatelessWidget {
  const BioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 50.h,
        maxWidth: 150.w,
      ),
      child: Text(
        "FCIS ... CS Dept✌🏻 UI/UX Designer",
        maxLines: 2,
        style:
            AppTextStyles.meduimBody16W500WhiteOnlyTitleTextStyle(context),
      ),
    );
  }
}
