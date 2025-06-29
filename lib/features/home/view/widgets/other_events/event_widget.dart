import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/home/data/models/event_model.dart';
import 'package:prize/features/home/view/widgets/other_events/days_left_widget.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key, required this.event});

  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: 180.w,
      decoration: BoxDecoration(
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        spacing: 8.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
              image: DecorationImage(
                image: NetworkImage(event.speakerImage),
              ),
            ),
          ),
          Text(
            event.speakerName,
            style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            event.eventTitle,
            style:
                AppTextStyles.meduimBody16W500TitleTextStyle(context).copyWith(
              fontSize: 14,
            ),
          ),
          DaysLeftWidget()
        ],
      ),
    );
  }
}
