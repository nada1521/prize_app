import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/orders/data/models/order_model.dart';

class OrderIDAndDateWidget extends StatelessWidget {
  const OrderIDAndDateWidget({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: LocaleKeys.core_id.tr(),
              style: AppTextStyles.smallBodyTitle12w500TextStyle(context),
            ),
            TextSpan(
                text: order.orderId,
                style: AppTextStyles.headTitle14w500WhiteAndDarkBlueTextStyle(
                    context)),
          ]),
        ),
        Text(DateFormat(AppConstants.dateFormatterPattern).format(order.orderPlaced).toString()),
      
      ],
    );
  }
}
