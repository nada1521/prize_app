import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/horizontal_product_widget.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/views/widgets/cancel_order_screen.dart';
import 'package:prize/generated/locale_keys.g.dart';

class ItemsSummaryWidget extends StatelessWidget {
  const ItemsSummaryWidget({super.key, required this.order});

  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      padding: EdgeInsets.symmetric(
        vertical: 18.h,
        horizontal: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.OrderDetails_items_summary.tr(),
                style: AppTextStyles.headTitle14w500WhiteAndDarkBlueTextStyle(
                        context)
                    .copyWith(
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Text(
                "(2 item)",
                style: AppTextStyles
                        .meduimBody16W500DarkAndLightThemeTitleTextStyle(
                            context)
                    .copyWith(
                  fontSize: 14,
                ),
              )
            ],
          ),
          verticalSpace(10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => HorizontalProductWidget(
              productCount: order.orderProductDataModel[index].productCount,
              productPath: order.orderProductDataModel[index].productImageUrl,
            ),
            itemCount: 2,
            scrollDirection: Axis.vertical,
          ),
          horizontalSpace(10),
          TextButton(
            onPressed: () {
              pushTo(context, CancelOrderScreen(
                order: order,
              ));
            },
            child: Text(
              "Cancel order",
              style: TextStyle(
                color: AppColors.darkModeTanOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
