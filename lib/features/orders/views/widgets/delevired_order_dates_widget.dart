import 'package:flutter/material.dart';
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
