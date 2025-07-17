import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/shop/views/screens/shop_products_screen.dart';

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 100.w, maxHeight: 100.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.outline,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: SvgPicture.asset(
              AppSvgs.ordersBox,
            ),
          ),
        ),
        verticalSpace(15),
        Text(
          LocaleKeys.my_order_screen_message_not_order.tr(),
          style: AppTextStyles.bodyTitle18w400TextStyle(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpace(15),
        AppSubmitButton(
          onTap: () {
            AppNavigator.pushSlideX(context, ShopProductsScreen());
          },
          title: LocaleKeys.core_go_shopping.tr(),
        )
      ],
    );
  }
}
