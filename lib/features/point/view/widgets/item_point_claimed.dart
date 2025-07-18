import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/features/point/view/widgets/custom_item_container_point.dart';
import 'package:prize/features/point/view/widgets/state_claimed.dart';
import 'package:prize/features/point/view/widgets/ticket_container.dart';
import 'package:prize/features/point/view/widgets/voucher_text_column.dart';

class ItemPointClaimed extends StatelessWidget {
  const ItemPointClaimed({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomItemContainerPoint(
      children: [
        StateClaimed(),
        Row(
          children: [
            VoucherTextColumn(
                title: "WSGHYBN",
                subTitle: "${LocaleKeys.point_screen_off.tr()} 20%"),
            horizontalSpace(8),
            TicketContainer(),
          ],
        )
      ],
    );
  }
}
