import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/checkout/data/models/payment_method_model.dart';
import 'package:prize/features/cart/checkout/views/widgets/select_payment_method_widget.dart';

class ChargeWalletPage extends StatefulWidget {
  const ChargeWalletPage({super.key});

  @override
  State<ChargeWalletPage> createState() => _ChargeWalletPageState();
}

class _ChargeWalletPageState extends State<ChargeWalletPage> {
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

  final TextEditingController priceController = TextEditingController();
  double vat = 0;
  dynamic supTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(title: "Charge wallet"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Price"),
              verticalSpace(8),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "00",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onChanged: (value) {
                  setState(() {
                    supTotal = value;
                  });
                },
              ),
              verticalSpace(20),
              Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: "Order summary",
                          style:
                              AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(
                                      context)
                                  .copyWith(
                                      color: AppColors.darkBlue,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                          children: [
                            TextSpan(
                                text: "  (2 item)",
                                style:
                                    AppTextStyles.smallBodyTitle12w500TextStyle(
                                        context))
                          ]),
                    ),
                    verticalSpace(5),
                    Text(
                      "Subtotal: ${priceController.text}",
                      style: AppTextStyles
                          .headTitle14w500WhiteAndDarkBlueTextStyle(context),
                    ),
                    verticalSpace(5),
                    Text("VAT: $vat",
                        style: AppTextStyles.smallHeadTitle12w400TextStyle(
                            context)),
                    verticalSpace(8),
                    Text(
                      "Total: 400",
                      style: AppTextStyles
                          .headTitle14w500WhiteAndDarkBlueTextStyle(context),
                    ),
                  ],
                ),
              ),
              verticalSpace(20),
              SelectPaymentMethodWidget(),
              verticalSpace(40),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    color: AppColors.orangeTanHide,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Pay",
                    style: AppTextStyles.smallHeadTitle12w400TextStyle(context)
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
