import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/custom_shapes/custom_slider_thumb_shape_widget.dart';
import 'package:prize/core/widgets/custom_shapes/triangle_widget.dart';

class PriceRangeSliderWidget extends StatefulWidget {
  final double min;
  final double max;
  final RangeValues initialValues;
  final ValueChanged<RangeValues>? onChanged;

  const PriceRangeSliderWidget({
    super.key,
    this.min = 120,
    this.max = 1500,
    required this.initialValues,
    this.onChanged,
  });

  @override
  State<PriceRangeSliderWidget> createState() => _PriceRangeSliderWidgetState();
}

class _PriceRangeSliderWidgetState extends State<PriceRangeSliderWidget> {
  late RangeValues currentValues;

  @override
  void initState() {
    super.initState();
    currentValues = widget.initialValues;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price",
          style: AppTextStyles.bodyTitle18w400darkPeriwinkleTextStyle(context)
              .copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.h),
        LayoutBuilder(
          builder: (context, constraints) {
            final double sliderWidth = constraints.maxWidth;

            double startPercent =
                (currentValues.start - widget.min) / (widget.max - widget.min);
            double endPercent =
                (currentValues.end - widget.min) / (widget.max - widget.min);

            double leftStart = startPercent * sliderWidth;
            double leftEnd = endPercent * sliderWidth;

            return SizedBox(
              height: 90.h,
              child: Stack(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: CustomSliderThumbShape(
                        fillColor: AppWidgetColor.fillBackgroundColor(context),
                        borderColor: AppColors.darkModeTanOrange,
                      ),
                    ),
                    child: RangeSlider(
                      values: currentValues,
                      onChanged: (newValues) {
                        setState(() {
                          currentValues = newValues;
                        });
                        widget.onChanged?.call(newValues);
                      },
                      min: widget.min,
                      max: widget.max,
                      activeColor: Colors.orange,
                      inactiveColor:
                          AppWidgetColor.fillIconButtonWidgetColor(context),
                    ),
                  ),
                  Positioned(
                    left: leftStart.clamp(0, sliderWidth - 64),
                    top: 0,
                    child: _buildTooltip("₺ ${currentValues.start.toInt()}"),
                  ),
                  Positioned(
                    left: leftEnd.clamp(0, sliderWidth - 64),
                    top: 0,
                    child: _buildTooltip("₺ ${currentValues.end.toInt()}"),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _minOrMaxValue(AppSvgs.currency, widget.min.toInt()),
              Text("₺ ${widget.max.toInt()}",
                  style: AppTextStyles.meduimBody16W500TitleTextStyle(context)
                      .copyWith(fontSize: 14, color: AppColors.darkBlue)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTooltip(String value) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
            bottom: 32,
            child: TriangleWidget(
              size: Size(20.w, 14.h),
              fillColor: AppWidgetColor.fillIconButtonWidgetColor(context),
            )),
        Container(
          width: 56.w,
          height: 30.h,
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: BoxDecoration(
            color: AppWidgetColor.fillIconButtonWidgetColor(context),
            borderRadius: BorderRadius.circular(6),
          ),
          child: FittedBox(
            child: Row(
              children: [
                SvgPicture.asset(AppSvgs.currency),
                Text(
                  value,
                  style: AppTextStyles.meduimBody16W500TitleTextStyle(context)
                      .copyWith(fontSize: 12, color: AppColors.darkBlue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _minOrMaxValue(String iconPath, int value) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        horizontalSpace(4),
        Text(
          "$value",
          style: AppTextStyles.meduimBody16W500TitleTextStyle(context)
              .copyWith(fontSize: 14, color: AppColors.darkBlue),
        ),
      ],
    );
  }
}
