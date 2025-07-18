import 'package:flutter/material.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class OrderCancelledWidget extends StatelessWidget {
  const OrderCancelledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Cancelled",
          style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(context)
              .copyWith(
            color: AppColors.errorRed,
          ),
        ),
        Text(
          "Thursday, 30 Nov 2023 - 02:00 PM",
          style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(context)
              .copyWith(
            color: AppColors.errorRed,
          ),
        ),
        verticalSpace(8),
        Row(
          children: [
            Text(
              "Cancellation Reason :",
              style:
                  AppTextStyles.meduimBody16W500DarkAndLightThemeTitleTextStyle(
                          context)
                      .copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              'I change my mind',
              style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(context),
            ),
          ],
        )
      ],
    );
  }
}
