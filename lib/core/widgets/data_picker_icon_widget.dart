import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';

class DatePickerIconWidget extends StatelessWidget {
  final TextEditingController controller;

  const DatePickerIconWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          String formattedDate =
              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
          controller.text = formattedDate;
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SvgPicture.asset(
          AppSvgs.calendar,
          width: 22.w,
          height: 22.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
