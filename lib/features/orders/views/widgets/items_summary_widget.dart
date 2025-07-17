import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/generated/locale_keys.g.dart';

class ItemsSummaryWidget extends StatelessWidget {
  const ItemsSummaryWidget({super.key, required this.order});

  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.OrderDetails_items_summary.tr(),
                style: AppTextStyles
                    .meduimBody16W500DarkAndLightThemeTitleTextStyle(context),
              ),
            ],
          ),
          SizedBox(
            height: 89.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Stack(
                children: [
                  ShowProductImageWidget(
                    width: 92.w,
                    image: AssetImage(
                        order.orderProductDataModel[index].productImageUrl),
                    imageUrl: "",
                  ),
                  if (order.orderProductDataModel[index].productCount != 1)
                    Positioned(
                      right: 5.w,
                      child: Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.errorRed,
                        ),
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            child: Text(
                              "x${order.orderProductDataModel[index].productCount.toString()}",
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              itemCount: order.orderProductDataModel.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
