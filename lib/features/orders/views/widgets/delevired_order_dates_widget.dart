import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/orders/views/widgets/build_date_row_widget.dart';

class DeleviredOrderDatesWidget extends StatelessWidget {
  const DeleviredOrderDatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildDateRowWidget(
          dateTitle: 'Order Placed',
          date: DateTime.now(),
          context: context,
        ),
        BuildDateRowWidget(
          dateTitle: 'Confirmed',
          date: DateTime.now(),
          context: context,
        ),
        BuildDateRowWidget(
          dateTitle: 'Shipped',
          date: DateTime.now(),
          context: context,
        ),
        BuildDateRowWidget(
          dateTitle: 'Delivered',
          date: DateTime.now(),
          context: context,
        ),
      ],
    );
  }

}
