import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/features/setting/help_center/view/screens/chat_with_us_landing_screen.dart';

class ChatWithUsWidget extends StatelessWidget {
  const ChatWithUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112.h,
      width: 350.w,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.regentBlue,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                "If you still have any question, Chat with us!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 7,
            child: AppFillBckgroundButton(
              onTap: () => pushTo(
                context,
                ChatWithUsLandingScreen(),
              ),
              width: 200.w,
              height: 50.h,
              title: "Chat with us",
              icon: SvgPicture.asset(
                AppSvgs.chatWithUsMessagesIcon,
              ),
              borderRadius: BorderRadius.circular(40.r),
            ),
          ),
        ],
      ),
    );
  }
}
