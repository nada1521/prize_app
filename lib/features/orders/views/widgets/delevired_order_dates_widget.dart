import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/features/orders/views/widgets/build_date_row_widget.dart';

class DeleviredOrderDatesWidget extends StatelessWidget {
  const DeleviredOrderDatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildDateRowWidget(
          dateTitle: LocaleKeys.OrderDetails_order_placed.tr(),
          date: DateTime.now(),
          context: context,
        ),
        BuildDateRowWidget(
          dateTitle: LocaleKeys.order_state_confirmed.tr(),
          date: DateTime.now(),
          context: context,
        ),
        BuildDateRowWidget(
          dateTitle: LocaleKeys.order_state_shipped.tr(),
          date: DateTime.now(),
          context: context,
        ),
        BuildDateRowWidget(
          dateTitle: LocaleKeys.order_state_delivered.tr(),
          date: DateTime.now(),
          context: context,
        ),
      ],
    );
  }

}
