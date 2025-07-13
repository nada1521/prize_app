import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class ShowAvailableColorsWidget extends StatefulWidget {
  const ShowAvailableColorsWidget({super.key});

  @override
  State<ShowAvailableColorsWidget> createState() =>
      _ShowAvailableColorsWidgetState();
}

class _ShowAvailableColorsWidgetState extends State<ShowAvailableColorsWidget> {
  final List<Color> availableColors = const [
    AppColors.darkBlue,
    Colors.blue,
    Colors.orange,
    Colors.white,
  ];

  int selectedIndex = 0; // اللون المختار

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.product_details_show_varilable_color.tr(),
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
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    border: isSelected
                        ? Border.all(
                            color: AppColors.darkModeTanOrange,
                            width: 2,
                          )
                        : null,
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
