import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/features/home/view/widgets/upcoming_events/all_comming_events_widget.dart';
import 'package:prize/features/home/view/widgets/upcoming_events/upcoming_events_app_bar_widget.dart';

class UpcomingEventsWidget extends StatelessWidget {
  const UpcomingEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 160.h,
      ),
      child: Column(
        children: [
          UpComingEventsAppBar(),
          verticalSpace(15),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 5.w, end: 5.w),
            child: SizedBox(
              height: 80.h,
              width: double.infinity,
              child: AllCommingEventsWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
