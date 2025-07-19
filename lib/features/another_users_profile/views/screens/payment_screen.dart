import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/dialog/base/pop_up_dialog.dart';
import 'package:prize/core/widgets/horizontal_product_widget.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/another_users_profile/views/widgets/popupAndBottomShets/contribute_to_the_purchase_successfully_pop_up_widget.dart';
import 'package:prize/features/cart/checkout/views/widgets/select_payment_method_widget.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/orders/views/widgets/delivery_address_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.payment_screen_payment.tr(),
        showBackButton: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HorizontalProductWidget(
                    productPath: AppImages.tShirtBlack, productCount: 1),
                verticalSpace(10),
                DeliveryAddressWidget(),
                verticalSpace(10),
                SelectPaymentMethodWidget(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: screensPadding,
        child: SizedBox(
          height: 90.h,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          LocaleKeys.cart_screen_total.tr(),
                          style: AppTextStyles
                                  .meduimBody16W500BlackAndWhiteTitleTextStyle(
                                      context)
                              .copyWith(
                            fontSize: 14,
                          ),
                        ),
                        horizontalSpace(8),
                        Text(
                          LocaleKeys.cart_screen_inclusive_of_vat.tr(),
                          style: AppTextStyles.smallBodyTitle12w400TextStyle(
                                  context)
                              .copyWith(
                            color: AppColors.periwinkle,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppSvgs.currency,
                          width: 20.w,
                          height: 20.h,
                        ),
                        horizontalSpace(5),
                        Text(
                          "120",
                          style: AppTextStyles.headTitle24w600TextStyle(context)
                              .copyWith(
                            color: AppColors.darkModeTanOrange,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: AppSubmitButton(
                      onTap: () {
                        showPopup(context,
                            ContributeToThePurchaseSuccessfullyPopUpWidget());
                      },
                      title: LocaleKeys.payment_screen_continue_to_pay.tr()))
            ],
          ),
        ),
      ),
    );
  }
}
