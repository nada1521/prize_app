import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/all_mothers_day_gifts_widget.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/mothers_day_gifts_appbar.dart';

class MothersDayGiftsWidget extends StatelessWidget {
  const MothersDayGiftsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MothersDayGiftsAppbar(),
        SizedBox(
          width: double.infinity,
          height: 350.h,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
            child: AllMothersDayGiftsWidget(),
          ),
        ),
      ],
    );
  }
}
