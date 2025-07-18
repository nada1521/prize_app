import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';

class TicketContainer extends StatelessWidget {
  const TicketContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color(0xffeaecf8)),
      child: SvgPicture.asset(
        AppSvgs.ticket,
        color: Colors.black,
      ),
    );
  }
}
