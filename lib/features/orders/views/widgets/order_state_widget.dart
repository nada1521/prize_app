// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

import 'package:prize/features/orders/data/models/order_model.dart';

class OrderStateWidget extends StatelessWidget {
  const OrderStateWidget({
    super.key,
    required this.orderState,
  });

  final OrderState orderState;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: _getBackgroundColor(orderState),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 5.h),
        child: FittedBox(
          child: Text(
            orderState.name,
            style: AppTextStyles.smallBodyTitle12w400WithContrastColorTextStyle(
                    context)
                .copyWith(
              color: _getTextColor(orderState),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(OrderState state) {
    switch (state) {
      case OrderState.inProgress:
        return AppColors.tanOrange.withOpacity(.15);
      case OrderState.shipped:
        return AppColors.blueColor.withOpacity(.15);
      case OrderState.delivered:
        return Colors.green.withOpacity(.15);
      case OrderState.cancelled:
        return AppColors.errorRed.withOpacity(.15);
      case OrderState.ordered:
        // TODO: Handle this case.
        throw UnimplementedError();
      case OrderState.confirmed:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Color _getTextColor(OrderState state) {
    switch (state) {
      case OrderState.inProgress:
        return AppColors.tanOrange;
      case OrderState.shipped:
        return AppColors.blueColor;
      case OrderState.delivered:
        return Colors.green;
      case OrderState.cancelled:
        return AppColors.errorRed;
      case OrderState.ordered:
        // TODO: Handle this case.
        throw UnimplementedError();
      case OrderState.confirmed:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
