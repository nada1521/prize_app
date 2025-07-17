import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/views/widgets/order_tracking_timeline.dart';

class TrackingOrderWidget extends StatelessWidget {
  const TrackingOrderWidget({super.key, required this.order});

  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 10.w,
              ),
              child: Text(
                LocaleKeys.OrderDetails_tracking_order.tr(),
                style:
                    AppTextStyles.meduimBody16W500BlackAndWhiteTitleTextStyle(
                        context),
              ),
            ),
            OrderTrackingTimeline(
              currentStep: 0,
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 10.w,
              ),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.OrderDetails_order_placed.tr(),
                    style: AppTextStyles
                            .smallBodyTitle12w400WithContrastColorTextStyle(
                                context)
                        .copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(DateFormat('dd MMM yyyy')
                      .format(order.orderPlaced)
                      .toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
