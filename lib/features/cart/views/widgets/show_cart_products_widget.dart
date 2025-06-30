import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/utils/resources/counter_app_widget.dart';
import 'package:prize/core/widgets/app_disable_button.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';

class ShowCartProductsWidget extends StatelessWidget {
  const ShowCartProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.amber,
      constraints: BoxConstraints(
        maxHeight: 231.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowProductImageWidget(
                  imageUrl: productsWithoutOffer[0].image,
                  width: 100.w,
                  height: 100.h,
                ),
                horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Defacto"), // no need localizition ❌

                    ShowProductTitleWidget(
                      title: productsWithoutOffer[0].title,
                      maxLines: 2,
                      textHeight: 60.h,
                      maxHeight: 40.h,
                    ),

                    ShowProductPriceWidget(
                      newPrice: "644",
                      oldPrice: "810",
                    ),

                    Container(
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color:
                              AppWidgetColor.fillIconButtonWidgetColor(context),
                          borderRadius: BorderRadius.circular(48.r)),
                      child: FittedBox(
                        child: Padding(
                          padding:
                              EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                          child: Text("Black / XL"),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: SvgPicture.asset(AppSvgs.heart),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                AppOutLineButton(
                  height: 40.h,
                  width: 100.w,
                  onTap: () {},
                  title: "Remove",
                  icon: SvgPicture.asset(AppSvgs.removeTrash),
                  border: GlobalAppWidgetsStyles.containerPeriwinkleBoxBorder(
                      context),
                  style: AppTextStyles.appEmptyFillColorButtonTextStyle(context)
                      .copyWith(color: AppColors.darkPeriwinkle),
                ),
                Spacer(),
                CounterAppWidget(
                  value: 4,
                  onChanged: (v) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
