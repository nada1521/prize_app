import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';

class OrderProductWidget extends StatelessWidget {
  const OrderProductWidget({super.key, required this.product , this.maxHeight});

  final ProductModel product;
 final double? maxHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      constraints: BoxConstraints(
        maxHeight: maxHeight?? 235.h,
      ),
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShowProductImageWidget(
                imageUrl: productsWithoutOffer[0].image,
                width: 90.w,
                height: 130.h,
              ),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Defacto"),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 160.w,
                    ),
                    child: ShowProductTitleWidget(
                      title: product.title,
                      maxLines: 2,
                      textHeight: 60.h,
                      maxHeight: 40.h,
                    ),
                  ),
                  ShowProductPriceWidget(
                    newPrice: product.newPrice,
                    oldPrice: product.oldPrice,
                  ),
                  Container(
                    height: 29.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppWidgetColor.fillIconButtonWidgetColor(context),
                      borderRadius: BorderRadius.circular(48.r),
                    ),
                    child: FittedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text("Black / XL"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
