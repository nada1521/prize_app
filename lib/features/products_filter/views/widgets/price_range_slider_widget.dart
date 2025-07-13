import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRangeSliderWidget extends StatefulWidget {
  final SfRangeValues initialValues;

  const PriceRangeSliderWidget({
    super.key,
    required this.initialValues,
  });

  @override
  State<PriceRangeSliderWidget> createState() => _PriceRangeSliderWidgetState();
}

class _PriceRangeSliderWidgetState extends State<PriceRangeSliderWidget> {
  SfRangeValues currentValues = SfRangeValues(1.0, 2.0);

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
          LocaleKeys.filter_product_price.tr(),
          style: AppTextStyles.bodyTitle18w400darkPeriwinkleTextStyle(context)
              .copyWith(fontWeight: FontWeight.w600),
        ),
        verticalSpace(10),
        SfRangeSliderTheme(
          data: SfRangeSliderThemeData(
            thumbStrokeWidth: 4,
            thumbStrokeColor: AppColors.orangeTanHide,
            activeDividerColor: AppColors.white,
            thumbColor: AppColors.white,
            tooltipBackgroundColor:
                AppWidgetColor.fillIconButtonWidgetColor(context),
            tooltipTextStyle:
                AppTextStyles.meduimBody16W500DarkAndLightThemeTitleTextStyle(
                        context)
                    .copyWith(
              fontSize: 12,
              color: AppColors.darkBlue,
            ),
          ),
          child: SfRangeSlider(
            min: widget.initialValues.start,
            max: widget.initialValues.end,
            values: currentValues,
            interval: 20,
            inactiveColor: AppWidgetColor.fillIconButtonWidgetColor(context),
            enableTooltip: true,
            tooltipShape: SfRectangularTooltipShape(),
            tooltipTextFormatterCallback: (actualValue, formattedText) {
              return "₺ ${actualValue.toStringAsFixed(0)}";
            },
            numberFormat: NumberFormat.currency(
                locale: 'tr', symbol: '₺', decimalDigits: 0),
            showTicks: false,
            showLabels: false,
            onChanged: (SfRangeValues values) {
              setState(() {
                currentValues = values;
              });
            },
          ),
        ),
        verticalSpace(12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _minOrMaxValue(
                  AppSvgs.currency, widget.initialValues.start.toInt()),
              const Spacer(),
              SvgPicture.asset(
                AppSvgs.currency,
                color: AppWidgetColor.fillWithContrastColor(context),
              ),
              Text(
                "${widget.initialValues.end.toInt()}",
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

  Widget _minOrMaxValue(String iconPath, int value) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          color: AppWidgetColor.fillWithContrastColor(context),
        ),
        horizontalSpace(4),
        Text(
          "$value",
          style: AppTextStyles.meduimBody16W500DarkAndLightThemeTitleTextStyle(
                  context)
              .copyWith(fontSize: 14, color: AppColors.darkBlue),
        ),
      ],
    );
  }
}
