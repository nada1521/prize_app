import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/multi_segment_linear_indicator.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/another_users_profile/data/product_wishlist_product_progress_model.dart';
import 'package:prize/features/another_users_profile/views/screens/contribute_to_the_gift_product_screen.dart';
import 'package:prize/features/another_users_profile/views/widgets/diagonal_progress_bar.dart';

class ProductWishlistProgressWidget extends StatelessWidget {
  const ProductWishlistProgressWidget({super.key, required this.product});

  final ProductWishlistProductProgressModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(
            context,
            ContributeToTheGiftProductScreen(
              product: product,
            ));
      },
      child: Container(
        color: AppWidgetColor.fillIconButtonWidgetColor(context),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Image.asset(AppImages.tShirtBlack),
            ),
            DiagonalProgressBar(
              percent: product.precent,
              height: 30.h,
              borderRadius: BorderRadiusGeometry.circular(6.r),
            ),
          ],
        ),
      ),
    );
  }
}
