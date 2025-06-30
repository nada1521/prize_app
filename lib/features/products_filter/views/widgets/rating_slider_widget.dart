import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  @override
  void initState() {
    super.initState();
    currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    const double min = 1.2;
    const double max = 5.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rating",
          style: AppTextStyles.bodyTitle18w400darkPeriwinkleTextStyle(context)
              .copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        verticalSpace(5),
        Text(
          "This is the score of the product from a customer who purchased a product",
          style: AppTextStyles.smallBodyTitle12w400TextStyle(context),
        ),
        verticalSpace(5),
        LayoutBuilder(
          builder: (context, constraints) {
            final double sliderWidth = constraints.maxWidth;

            double percent = (currentRating - min) / (max - min);
            double left = percent * sliderWidth;

            return SizedBox(
              height: 70.h,
              child: Stack(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: CustomSliderThumbShape(
                        fillColor: AppWidgetColor.fillBackgroundColor(context),
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
                  Positioned(
                    left: left.clamp(0, sliderWidth - 64),
                    bottom: 10,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                            bottom: 32,
                            child: TriangleWidget(
                              size: Size(20.w, 14.h),
                              fillColor:
                                  AppWidgetColor.fillIconButtonWidgetColor(
                                      context),
                            )),
                        Container(
                          width: 56.w,
                          margin: EdgeInsets.only(bottom: 36.h),
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
                              style:
                                  AppTextStyles.meduimBody16W500TitleTextStyle(
                                          context)
                                      .copyWith(
                                fontSize: 12,
                                color: AppColors.darkBlue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1.2 Stars",
                style: AppTextStyles.meduimBody16W500TitleTextStyle(context)
                    .copyWith(
                  fontSize: 14,
                  color: AppColors.darkBlue,
                ),
              ),
              Text(
                "5 Stars",
                style: AppTextStyles.meduimBody16W500TitleTextStyle(context)
                    .copyWith(
                  fontSize: 14,
                  color: AppColors.darkBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
