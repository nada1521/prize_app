import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/utils/resources/counter_app_widget.dart';
import 'package:prize/core/widgets/app_back_button.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/features/another_users_profile/data/product_wishlist_product_progress_model.dart';
import 'package:prize/features/another_users_profile/views/widgets/popupAndBottomShets/contribute_to_the_purchase_bottom_sheet_widget.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_rating_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/select_size_multi_choise.dart';
import 'package:prize/features/complete_profile/view/widgets/show_available_colors_widget.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/mothers_day_gifts_widget.dart'
    show MothersDayGiftsWidget;
import 'package:prize/features/product_details/views/widgets/images_slider_widget.dart';
import 'package:prize/features/product_details/views/widgets/overview_review_tab_widget.dart';
import 'package:prize/features/product_details/views/widgets/sold_by_widget.dart';

class ContributeToTheGiftProductScreen extends StatelessWidget {
  const ContributeToTheGiftProductScreen({super.key, required this.product});

  final ProductWishlistProductProgressModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
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
                            product.product.image,
                            product.product.image,
                            product.product.image,
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
                              title: product.product.title,
                              maxLines: 3,
                              textHeight: 50.h,
                              maxHeight: 50.h,
                            ),
                            ShowProductPriceWidget(
                              newPrice: product.product.newPrice,
                              oldPrice: product.product.oldPrice,
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
                                CounterAppWidget(onChanged: (value) {})
                              ],
                            ),
                            verticalSpace(10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: AppFillBckgroundButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ContributeToThePurchaseBottomSheetWidget(
                productProgressModel: product,
              ),
            );
          },
          title: "Contribute to the gift",
          icon: SvgPicture.asset(AppSvgs.giftIcon),
        ),
      ),
    );
  }
}
