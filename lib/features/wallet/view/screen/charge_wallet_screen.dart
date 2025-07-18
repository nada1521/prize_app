import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/app_text_form_field.dart';
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
      paymentName: LocaleKeys.core_wallet.tr(),
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
      appBar: OrangeAppbarWidget(
          title: LocaleKeys.wallet_screen_charge_wallet.tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.core_price.tr()),
              verticalSpace(8),
              AppTextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                hintText: '00',
                validator: (value) {},
                onChang: (value) {
                  setState(() {
                    supTotal = value;
                  });
                },
              ),
              verticalSpace(20),
              OrderSummaryWalletItem(
                  priceController: priceController, vat: vat),
              verticalSpace(20),
              SelectPaymentMethodWidget(),
              verticalSpace(40),
              AppFillBckgroundButton(
                  onTap: () {}, title: LocaleKeys.wallet_screen_pay.tr()),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderSummaryWalletItem extends StatelessWidget {
  const OrderSummaryWalletItem({
    super.key,
    required this.priceController,
    required this.vat,
  });

  final TextEditingController priceController;
  final double vat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
                text: LocaleKeys.wallet_screen_order_summary.tr(),
                style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(context)
                    .copyWith(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                children: [
                  TextSpan(
                      text: "  (2 ${LocaleKeys.wallet_screen_item.tr()})",
                      style:
                          AppTextStyles.smallBodyTitle12w500TextStyle(context))
                ]),
          ),
          verticalSpace(5),
          Text(
            "${LocaleKeys.wallet_screen_subtotal.tr()}${priceController.text}",
            style:
                AppTextStyles.headTitle14w500WhiteAndDarkBlueTextStyle(context),
          ),
          verticalSpace(5),
          Text("${LocaleKeys.wallet_screen_vat.tr()} $vat",
              style: AppTextStyles.smallHeadTitle12w400TextStyle(context)),
          verticalSpace(8),
          Text(
            "${LocaleKeys.core_total.tr()}400",
            style:
                AppTextStyles.headTitle14w500WhiteAndDarkBlueTextStyle(context),
          ),
        ],
      ),
    );
  }
}
