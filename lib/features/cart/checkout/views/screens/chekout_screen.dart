import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/dialog/base/pop_up_dialog.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/checkout/views/widgets/address_widget.dart';
import 'package:prize/features/cart/checkout/views/widgets/pop_up/order_successfully_placed_widget.dart';
import 'package:prize/features/cart/checkout/views/widgets/select_payment_method_widget.dart';
import 'package:prize/features/cart/checkout/views/widgets/show_products_in_order.dart';
import 'package:prize/features/cart/views/widgets/order_summary_widget.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_cart_cubit/adding_product_to_cart_cubit.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

class ChekoutScreen extends StatelessWidget {
  const ChekoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedProducts =
        context.watch<AddingProductToCartCubit>().state.selectedProducts;

    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.cart_screen_checkout.tr(),
        showBackButton: true,
      ),
      body: ListView(
        children: [
          AddressWidget(),
          verticalSpace(10),
          ShowProductsInOrder(),
          verticalSpace(10),
          SelectPaymentMethodWidget(),
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: OrderSummaryWidget(),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 130.h,
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            verticalSpace(16),
            Row(
              children: [
                Text(
                    "${selectedProducts.length} ${LocaleKeys.cart_screen_items.tr()}"),
                Spacer(),
                SvgPicture.asset(
                  AppSvgs.currency,
                  color: AppColors.darkModeTanOrange,
                ),
                Text(
                  selectedProducts
                      .fold<double>(
                          0.0,
                          (total, product) =>
                              total + double.tryParse(product.newPrice)!)
                      .toStringAsFixed(2),
                  style:
                      AppTextStyles.meduimBody16W600BlackAndWhiteTitleTextStyle(
                              context)
                          .copyWith(
                    color: AppColors.tanOrange,
                  ),
                )
              ],
            ),
            verticalSpace(16),
            AppSubmitButton(
              onTap: () {
                showPopup(context, OrderSuccessfullyPlacedWidget());
              },
              title: LocaleKeys.cart_screen_submit.tr(),
            )
          ],
        ),
      ),
    );
  }
}
