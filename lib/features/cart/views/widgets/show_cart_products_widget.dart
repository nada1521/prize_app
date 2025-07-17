import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/utils/resources/counter_app_widget.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_cart_cubit/adding_product_to_cart_cubit.dart';

class ShowCartProductsWidget extends StatefulWidget {
  const ShowCartProductsWidget({super.key, required this.product});

  final ProductModel product;

  @override
  State<ShowCartProductsWidget> createState() => _ShowCartProductsWidgetState();
}

class _ShowCartProductsWidgetState extends State<ShowCartProductsWidget> {
  bool isVisible = true;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    context.watch<AddingProductToCartCubit>();
    return Visibility(
      visible: isVisible,
      child: Container(
        width: double.infinity,
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        constraints: BoxConstraints(
          maxHeight: 235.h,
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
                        title: widget.product.title,
                        maxLines: 2,
                        textHeight: 60.h,
                        maxHeight: 40.h,
                      ),
                    ),
                    ShowProductPriceWidget(
                      newPrice: widget.product.newPrice,
                      oldPrice: widget.product.oldPrice,
                    ),
                    Container(
                      height: 29.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color:
                            AppWidgetColor.fillIconButtonWidgetColor(context),
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
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: SvgPicture.asset(
                    isFavorite ? AppSvgs.fiilHeartIcon : AppSvgs.heart,
                    color: isFavorite
                        ? AppWidgetColor.favoriteSelectedIconColor
                        : AppWidgetColor.favoriteUnSelectedIconColor(context),
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                AppOutLineButton(
                  height: 40.h,
                  width: 100.w,
                  onTap: () {
                    setState(() {
                      isVisible = false;
                    });
                    context
                        .read<AddingProductToCartCubit>()
                        .removeProduct(widget.product);
                  },
                  title: LocaleKeys.cart_screen_remove.tr(),
                  icon: SvgPicture.asset(AppSvgs.removeTrash),
                  border: GlobalAppWidgetsStyles.containerPeriwinkleBoxBorder(
                      context),
                  style: AppTextStyles.appEmptyFillColorButtonTextStyle(context)
                      .copyWith(color: AppColors.darkPeriwinkle),
                ),
                const Spacer(),
                CounterAppWidget(
                  onChanged: (v) {
                    widget.product.quantity = v;
                    debugPrint("=========== $v");
                    debugPrint("=======68==== ${widget.product.quantity}");
                    context.read<AddingProductToCartCubit>().updateProduct(
                          ProductModel(
                            image: widget.product.image,
                            newPrice: widget.product.newPrice,
                            oldPrice: widget.product.oldPrice,
                            title: widget.product.title,
                            quantity: v,
                            isOffer: widget.product.isOffer,
                          ),
                        );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
