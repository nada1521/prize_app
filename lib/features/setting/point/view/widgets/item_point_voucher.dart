import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/setting/point/view/widgets/custom_item_container_point.dart';
import 'package:prize/features/setting/point/view/widgets/ticket_container.dart';
import 'package:prize/features/setting/point/view/widgets/voucher_text_column.dart';

class ItemPointVoucher extends StatelessWidget {
  const ItemPointVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomItemContainerPoint(
      children: [
        ClaimTextButtom(),
        Row(
          children: [
            VoucherTextColumn(
                title: "${LocaleKeys.point_screen_Voucher.tr()} 20%",
                subTitle: '20 ${LocaleKeys.point_screen_point.tr()}',
                isSvgPicture: true),
            horizontalSpace(8),
            TicketContainer(),
          ],
        )
      ],
    );
  }
}

class ClaimTextButtom extends StatelessWidget {
  const ClaimTextButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Center(
        child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: AppColors.darkModeTanOrange),
            onPressed: () {},
            child: Text(
              LocaleKeys.point_screen_claim.tr(),
              style:
                  AppTextStyles.smallBodyTitle12w500WhiteOnlyTextStyle(context),
            )),
      ),
    );
  }
}
