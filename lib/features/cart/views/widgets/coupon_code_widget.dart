import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/core/widgets/app_text_form_field.dart';
import 'package:prize/features/cart/views/widgets/order_summary_widget.dart';

class CouponCodeWidget extends StatefulWidget {
  const CouponCodeWidget({super.key});

  @override
  State<CouponCodeWidget> createState() => _CouponCodeWidgetState();
}

class _CouponCodeWidgetState extends State<CouponCodeWidget> {
  final GlobalKey<FormState> kay = GlobalKey<FormState>();
  final TextEditingController? couponController = TextEditingController();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: kay,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                color:
                    AppWidgetColor.fillWidgetByLightBackgroundColor(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppWidgetColor.outlineWidgetColor,
                            width: 2,
                          ),
                        ),
                        child: AppTextFormField(
                          controller: couponController,
                          enabledBorder: null,
                          focusedBorder: null,
                          hintText: "Coupon Code",
                          validator: (coupon) =>
                              AppValidation.couponValidation(coupon),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 13.h),
                            child: SvgPicture.asset(
                              AppSvgs.ticket,
                              width: 16.w,
                              height: 16.h,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(5),
                      isValid
                          ? Text(
                              "Coupon Applied Successfully!",
                              style:
                                  AppTextStyles.headTitle14w400GreenTextStyle(
                                      context),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  flex: 1,
                  child: AppOutLineButton(
                    width: 50.w,
                    height: 50.h,
                    onTap: () {
                      final valid = kay.currentState?.validate() ?? false;
                      setState(() {
                        isValid = valid;
                      });

                      if (kay.currentState!.validate()) {
                      } else {}
                    },
                    title: "Apply",
                    border: Border.all(
                      width: 1,
                      color: isValid
                          ? AppColors.darkModeTanOrange
                          : AppColors.errorRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(10),
          OrderSummaryWidget(
            isCouponValid: isValid,
          )
        ],
      ),
    );
  }
}
