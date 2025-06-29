import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class ShowAvailableColorsWidget extends StatelessWidget {
  const ShowAvailableColorsWidget({super.key});

  final List<Color> availableColors = const [
    AppColors.darkBlue,
    Colors.blue,
    Colors.orange,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colors",
          style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
        ),
        verticalSpace(10),
        SizedBox(
          height: 32.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: availableColors.length,
            separatorBuilder: (context, index) => horizontalSpace(12),
            itemBuilder: (context, index) {
              final color = availableColors[index];
              return Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: Border.all(
                    color: AppColors.darkModeTanOrange,
                    width: 1,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
