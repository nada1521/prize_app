import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/features/home/view/widgets/other_events/all_events_widget.dart';
import 'package:prize/features/home/view/widgets/other_events/other_events_appbar.dart';

class OtherEventsWidget extends StatelessWidget {
  const OtherEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtherEventsAppbar(),
        verticalSpace(5),
        Container(
          height: 260.h,
          constraints: BoxConstraints(
            maxHeight: 270.h,
          ),
          width: double.infinity,
          child: AllEventsWidget(),
        ),
      ],
    );
  }
}
