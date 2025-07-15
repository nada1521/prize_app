import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_circular_checkbox.dart';
import 'package:prize/features/cart/checkout/data/models/payment_method_model.dart';

class SelectPaymentMethodWidget extends StatefulWidget {
  const SelectPaymentMethodWidget({super.key});

  @override
  State<SelectPaymentMethodWidget> createState() =>
      _SelectPaymentMethodWidgetState();
}

class _SelectPaymentMethodWidgetState extends State<SelectPaymentMethodWidget> {
  List<PaymentMethodModel> paymentMethods = [
    PaymentMethodModel(
      paymentName: LocaleKeys.cart_screen_debit_credit.tr(),
      paymentImage: AppImages.debitCartIcon,
    ),
    PaymentMethodModel(
      paymentName: LocaleKeys.cart_screen_wallet.tr(),
      paymentImage: AppImages.walletIcon,
    ),
    PaymentMethodModel(
      paymentName: "STC pay",
      paymentImage: AppImages.stcPayIcon,
    ),
    PaymentMethodModel(
      paymentName: LocaleKeys.cart_screen_mada.tr(),
      paymentImage: AppImages.madaIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.cart_screen_payment_method.tr(),
            style: AppTextStyles.meduimBody16W600BlackAndWhiteTitleTextStyle(
                context),
          ),
          verticalSpace(16),
          ListView.separated(
            shrinkWrap: true,
            itemCount: paymentMethods.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  AppCircularCheckbox(onChanged: (onChanged) {}),
                  Text(paymentMethods[index].paymentName),
                  Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: 10.w,
                    ),
                    child: Image.asset(paymentMethods[index].paymentImage),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => verticalSpace(12),
          ),
        ],
      ),
    );
  }
}
