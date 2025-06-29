import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class OverviewReviewTabWidget extends StatefulWidget {
  const OverviewReviewTabWidget({super.key});

  @override
  State<OverviewReviewTabWidget> createState() =>
      _OverviewReviewTabWidgetState();
}

class _OverviewReviewTabWidgetState extends State<OverviewReviewTabWidget> {
  int selectedIndex = 0;

  final List<String> titles = ['Overview', 'Review'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          // Tabs Row
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppWidgetColor.fillIconButtonWidgetColor(context),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: List.generate(titles.length, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        titles[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          verticalSpace(20),
          IndexedStack(
            index: selectedIndex,
            children: [
              _buildOverview(),
              _buildReview(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
          ),
          verticalSpace(10),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
            "sed do eiusmod tempor incididunt ut labore dolore magna aliqua. "
            "Ut enim ad veniam,aliquip ex ea commodo consequat.\n\n"
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
            "sed do eiusmod tempor incididunt ut labore dolore magna aliqua. "
            "Ut enim ad veniam,aliquip ex ea commodo consequat.",
            style:
                AppTextStyles.meduimBody16W500TitleTextStyle(context).copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReview() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text("Review content goes here..."),
    );
  }
}
