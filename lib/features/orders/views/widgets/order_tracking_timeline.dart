import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/generated/locale_keys.g.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrderTrackingTimeline extends StatelessWidget {
  const OrderTrackingTimeline({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> states = {
      LocaleKeys.order_state_ordered.tr(): AppSvgs.documentTextIcon,
      LocaleKeys.order_state_confirmed.tr(): AppSvgs.tickCircleIcon,
      LocaleKeys.order_state_shipped.tr(): AppSvgs.truckIcon,
      LocaleKeys.order_state_delivered.tr(): AppSvgs.boxTick,
    };

    return SizedBox(
      height: 70.h,
      child: Timeline.tileBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: const ConnectorThemeData(
            thickness: 0.5,
          ),
          indicatorTheme: const IndicatorThemeData(
            size: 24.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: states.length,
          contentsBuilder: (_, index) {
            final isActive = index <= currentStep;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                states.keys.toList()[index],
                style: AppTextStyles
                        .smallBodyTitle12w400WithContrastColorTextStyle(context)
                    .copyWith(
                  color: isActive
                      ? _getStepColor(index)
                      : AppColors.moreLighterDarkPeriwinkle,
                ),
              ),
            );
          },
          indicatorBuilder: (_, index) {
            final isActive = index <= currentStep;
            return DotIndicator(
              color: isActive
                  ? AppColors.greenColor
                  : AppColors.moreLighterDarkPeriwinkle,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: SvgPicture.asset(states.values.toList()[index]),
              ),
            );
          },
          connectorBuilder: (_, index, ___) {
            final isActive = index < currentStep;
            return SolidLineConnector(
              color: isActive
                  ? AppColors.greenColor
                  : AppColors.moreLighterDarkPeriwinkle,
            );
          },
        ),
      ),
    );
  }

  Color _getStepColor(int index) {
    switch (index) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
