import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/data/models/order_state_and_translation.dart';
import 'package:prize/features/orders/views/widgets/delevired_order_dates_widget.dart';
import 'package:prize/features/orders/views/widgets/order_cancelled_widget.dart';
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
            order.orderState != OrderState.cancelled
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 10.w,
                        ),
                        child: Text(
                          LocaleKeys.OrderDetails_tracking_order.tr(),
                          style: AppTextStyles
                              .meduimBody16W500BlackAndWhiteTitleTextStyle(
                                  context),
                        ),
                      ),
                      OrderTrackingTimeline(
                        currentStep:
                            getCurrentStep(order.orderState).keys.first,
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            verticalSpace(15),
            getCurrentStep(order.orderState).values.first,
            verticalSpace(8),
          ],
        ),
      ),
    );
  }

  Map<int, Widget> getCurrentStep(OrderState state) {
    switch (state) {
      case OrderState.ordered:
        return {
          0: DeleviredOrderDatesWidget(),
        };
      case OrderState.confirmed:
        return {
          1: DeleviredOrderDatesWidget(),
        };
      case OrderState.shipped:
        return {
          2: DeleviredOrderDatesWidget(),
        };
      case OrderState.delivered:
        return {
          3: DeleviredOrderDatesWidget(),
        };
      case OrderState.cancelled:
        return {
          4: OrderCancelledWidget(),
        };
      default:
        return {
          0: DeleviredOrderDatesWidget(),
        };
    }
  }
}
