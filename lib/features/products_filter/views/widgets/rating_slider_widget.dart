import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/custom_shapes/custom_slider_thumb_shape_widget.dart';
import 'package:prize/core/widgets/custom_shapes/triangle_widget.dart';

class RatingSliderWidget extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double>? onChanged;

  const RatingSliderWidget({
    super.key,
    required this.initialRating,
    this.onChanged,
  });

  @override
  State<RatingSliderWidget> createState() => _RatingSliderWidgetState();
}

class _RatingSliderWidgetState extends State<RatingSliderWidget> {
  late double currentRating;

  static const double min = 1.2;
  static const double max = 5.0;

  @override
  void initState() {
    super.initState();
    currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.filter_product_rating.tr(),
          style: AppTextStyles.bodyTitle18w400darkPeriwinkleTextStyle(context)
              .copyWith(fontWeight: FontWeight.w600),
        ),
        verticalSpace(5),
        Text(
          LocaleKeys.filter_product_product_rat.tr(),
          style: AppTextStyles.smallBodyTitle12w400TextStyle(context),
        ),
        verticalSpace(10),
        LayoutBuilder(
          builder: (context, constraints) {
            final double sliderWidth = constraints.maxWidth;
            final double percent = (currentRating - min) / (max - min);
            final double left = percent * (sliderWidth - 56);
            return SizedBox(
              height: 90.h,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: left.clamp(0, sliderWidth - 56.w),
                    top: 15,
                    child: Column(
                      children: [
                        Container(
                          width: 56.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: AppWidgetColor.fillIconButtonWidgetColor(
                                context),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              currentRating.toStringAsFixed(1),
                              style: AppTextStyles
                                      .meduimBody16W500DarkAndLightThemeTitleTextStyle(
                                          context)
                                  .copyWith(
                                fontSize: 12,
                                color: AppColors.darkBlue,
                              ),
                            ),
                          ),
                        ),
                        TriangleWidget(
                          size: Size(20.w, 14.h),
                          fillColor:
                              AppWidgetColor.fillIconButtonWidgetColor(context),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: CustomSliderThumbShape(
                          fillColor:
                              AppWidgetColor.fillBackgroundColor(context),
                          borderColor: AppColors.darkModeTanOrange,
                        ),
                      ),
                      child: Slider(
                        value: currentRating,
                        onChanged: (val) {
                          setState(() {
                            currentRating = val;
                          });
                          widget.onChanged?.call(val);
                        },
                        min: min,
                        max: max,
                        activeColor: Colors.orange,
                        inactiveColor:
                            AppWidgetColor.fillIconButtonWidgetColor(context),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        // verticalSpace(8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${LocaleKeys.filter_product_star_low.tr()} 1.5",
                style: AppTextStyles
                        .meduimBody16W500DarkAndLightThemeTitleTextStyle(
                            context)
                    .copyWith(fontSize: 14, color: AppColors.darkBlue),
              ),
              Text(
                "${LocaleKeys.filter_product_stars_high.tr()}5",
                style: AppTextStyles
                        .meduimBody16W500DarkAndLightThemeTitleTextStyle(
                            context)
                    .copyWith(fontSize: 14, color: AppColors.darkBlue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
