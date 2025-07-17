import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_circular_checkbox.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/core/widgets/horizontal_product_widget.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/orders/data/models/order_model.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key, required this.order});

  final OrderModel order;

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  // ✅ موديل السبب
  final List<CancelReasonModel> cancelReasons = [
    CancelReasonModel(id: 1, name: 'No reason'),
    CancelReasonModel(id: 2, name: 'I changed my mind'),
    CancelReasonModel(id: 3, name: 'I want to buy another product'),
    CancelReasonModel(id: 4, name: 'Other'),
  ];

  // ✅ السبب المختار

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Cancel Order",
        showBackButton: true,
      ),
      body: Container(
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          children: [
            Text(
              "Your order is going to be canceled",
              style: AppTextStyles.headTitle24w600TextStyle(context),
            ),
            verticalSpace(10),
            Text(
              "Reason for Cancellation",
              style: AppTextStyles.smallHeadTitle12w400TextStyle(context),
            ),
            verticalSpace(10),
            ListView.builder(
              itemCount: cancelReasons.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final reason = cancelReasons[index];
                bool isSelected = false;
                return InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = true;
                    });
                  },
                  child: Row(
                    children: [
                      AppCircularCheckbox(onChanged: (val) {
                        setState(() {
                          isSelected = val;
                        });
                      }),
                      Text(
                        reason.name,
                        style: AppTextStyles
                            .meduimBody16W500BlackAndWhiteTitleTextStyle(
                                context),
                      ),
                    ],
                  ),
                );
              },
            ),
            verticalSpace(15),
            ListView.builder(
              itemCount: widget.order.orderProductDataModel.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => HorizontalProductWidget(
                productCount: 2,
                productPath:
                    widget.order.orderProductDataModel[index].productImageUrl,
              ),
            ),
            verticalSpace(15),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
        child: Row(
          children: [
            Expanded(
              child: AppOutLineButton(onTap: () {}, title: "Cancel"),
            ),
            horizontalSpace(10),
            Expanded(
              flex: 2,
              child: AppFillBckgroundButton(
                onTap: () {
                  
                },
                title: "Confirm Cancellation",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CancelReasonModel {
  final int id;
  final String name;

  CancelReasonModel({required this.id, required this.name});
}
