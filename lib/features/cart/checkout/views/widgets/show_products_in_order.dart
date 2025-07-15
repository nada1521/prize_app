import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/cart/checkout/views/widgets/order_product_widget.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_cart_cubit/adding_product_to_cart_cubit.dart';

class ShowProductsInOrder extends StatelessWidget {
  const ShowProductsInOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedProducts =
        context.watch<AddingProductToCartCubit>().state.selectedProducts;

    return Container(
      color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${selectedProducts.length} ${LocaleKeys.cart_screen_items_in_order.tr()}",
            style: AppTextStyles.meduimBody16W500BlackAndWhiteTitleTextStyle(
                    context)
                .copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpace(24),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: selectedProducts.length,
            itemBuilder: (context, index) => OrderProductWidget(
              maxHeight: 130.h,
              product: selectedProducts[index],
            ),
          ),
        ],
      ),
    );
  }
}
