import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/utils/resources/counter_app_widget.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/confirm_order_successfully_bottom_sheet_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_rating_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/select_size_multi_choise.dart';
import 'package:prize/features/complete_profile/view/widgets/show_available_colors_widget.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_cart_cubit/adding_product_to_cart_cubit.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/mothers_day_gifts_widget.dart';
import 'package:prize/features/product_details/views/widgets/buttom_sheets/confirm_order_to_cart_bottom_sheet_widget.dart';
import 'package:prize/features/product_details/views/widgets/images_slider_widget.dart';
import 'package:prize/features/product_details/views/widgets/overview_review_tab_widget.dart';
import 'package:prize/features/product_details/views/widgets/sold_by_widget.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: widget.product.title,
        suffixIcon: AppCircularIconButton(
          iconPath: AppSvgs.shareForward,
          onTap: () {
            Share.share(widget.product.title);
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AppOutLineButton(
                onTap: () {
                  final double height = MediaQuery.of(context).size.height;

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      height: height / 4,
                      child: ConfirmOrderSuccessfullyBottomSheetWidget(
                        itemData: widget.product,
                      ),
                    ),
                  );
                },
                title: LocaleKeys.product_details_add_to_wishlist.tr(),
                icon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: SvgPicture.asset(
                    AppSvgs.heart,
                    width: 20.w,
                    height: 20.h,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: AppFillBckgroundButton(
                onTap: () {
                  final double height = MediaQuery.of(context).size.height;

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      height: height / 3,
                      child: ConfirmOrderToCartBottomSheetWidget(
                        itemData: widget.product,
                      ),
                    ),
                  );

                  context
                      .read<AddingProductToCartCubit>()
                      .addProduct(widget.product);
                },
                title: LocaleKeys.product_details_add_to_cart.tr(),
                icon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: SvgPicture.asset(
                    AppSvgs.cart,
                    width: 20.w,
                    height: 20.h,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppWidgetColor.fillIconButtonWidgetColor(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppWidgetColor.fillWidgetByLightBackgroundColor(
                            context),
                        child: ImagesSliderWidget(
                          images: [
                            widget.product.image,
                            widget.product.image,
                            widget.product.image,
                          ],
                        ),
                      ),
                      Container(
                        color: AppWidgetColor.fillWidgetColor(context),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(10),
                            ShowProductRatingWidget(rating: '4.1'),
                            ShowProductTitleWidget(
                              title: widget.product.title,
                              maxLines: 3,
                              textHeight: 50.h,
                              maxHeight: 50.h,
                            ),
                            ShowProductPriceWidget(
                              newPrice: widget.product.newPrice,
                              oldPrice: widget.product.oldPrice,
                            ),
                            verticalSpace(10),
                            ShowAvailableColorsWidget(),
                            verticalSpace(10),
                            SelectSizeMultiChoise(),
                            verticalSpace(10),
                            Column(
                              spacing: 5.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.product_details_quantity_title
                                      .tr(),
                                  style: AppTextStyles
                                      .meduimHead16w500TitleTextStyle(
                                    context,
                                  ),
                                ),
                                CounterAppWidget(
                                    value: 1, onChanged: (value) {})
                              ],
                            ),
                            verticalSpace(10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(10),
                OverviewReviewTabWidget(),
                verticalSpace(30),
                Container(
                  color: AppWidgetColor.fillWidgetColor(context),
                  child: Column(
                    children: [
                      SoldByWidget(),
                      verticalSpace(10),
                      MothersDayGiftsWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    // ssss
  }
}
