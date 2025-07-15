import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';

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
    return SizedBox(
      // height: 400.h,
      child: Form(
        key: kay,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppWidgetColor.outlineWidgetColor,
                          width: 1,
                        ),
                      ),
                      child: AppTextFormField(
                        hintText: LocaleKeys.cart_screen_coupon_code.tr(),
                        validator: (data) =>
                            AppValidation.couponValidation(data),
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
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: AppOutLineButton(
                      width: 50.w,
                      height: 50.h,
                      onTap: () {
                        if (kay.currentState!.validate()) {
                          setState(() {
                            isValid = true;
                          });
                        }
                      },
                      title: LocaleKeys.cart_screen_apply.tr(),
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
      ),
    );
  }
}
