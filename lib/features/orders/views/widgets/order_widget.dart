import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_divder_widget.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/views/widgets/order_state_widget.dart';
import 'package:prize/features/orders/views/widgets/rate_icon_button.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: LocaleKeys.my_order_screen_id.tr(),
                        style: AppTextStyles.smallBodyTitle12w500TextStyle(
                            context),
                      ),
                      TextSpan(
                          text: order.orderId,
                          style: AppTextStyles
                              .headTitle14w500WhiteAndDarkBlueTextStyle(
                                  context)),
                    ]),
                  ),
                  Text(DateFormat('dd MMM yyyy')
                      .format(order.orderPlaced)
                      .toString()),
                ],
              ),
              Spacer(),
              OrderStateWidget(
                orderState: order.orderState,
              ),
              horizontalSpace(8),
              InkWell(
                child: Icon(Icons.arrow_forward_ios_sharp),
              )
            ],
          ),
          AppDivderWidget(),
          Row(
            children: [
              SizedBox(
                height: 50.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ShowProductImageWidget(
                    width: 40.w,
                    image: AssetImage(
                        order.orderProductDataModel[index].productImageUrl),
                    imageUrl: "",
                  ),
                  itemCount: order.orderProductDataModel.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
          Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.lightModeGray,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Row(
              children: [
                FittedBox(child: Text(LocaleKeys.core_total.tr())),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppSvgs.currency,
                      color: AppWidgetColor.fillWithOppositeColor(context),
                    ),
                    FittedBox(
                        child: Text(
                      "1443",
                      style: AppTextStyles
                              .headTitle14w500WhiteAndDarkBlueTextStyle(context)
                          .copyWith(
                        fontSize: 14,
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: AppOutLineButton(
                    onTap: () {},
                    title: LocaleKeys.my_order_screen_order_again.tr(),
                    icon: SvgPicture.asset(AppSvgs.refreshIcon)),
              ),
              horizontalSpace(16),
              Expanded(
                child: RateIconButton(),
              )
            ],
          )
        ],
      ),
    );
  }
}
