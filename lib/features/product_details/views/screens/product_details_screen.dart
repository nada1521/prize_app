import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/utils/resources/counter_app_widget.dart';
import 'package:prize/core/widgets/app_disable_button.dart';
import 'package:prize/core/widgets/app_enable_button.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_rating_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/select_size_multi_choise.dart';
import 'package:prize/features/complete_profile/view/widgets/show_available_colors_widget.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/mothers_day_gifts_appbar.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/mothers_day_gifts_widget.dart';
import 'package:prize/features/product_details/views/widgets/overview_review_tab_widget.dart';
import 'package:prize/features/product_details/views/widgets/product_details_appbar_widget.dart';
import 'package:prize/features/product_details/views/widgets/sold_by_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: Container(
        height: 200.h,
         
        child: Row(
          spacing: 10.w,
          children: [
            AppFillBckgroundButton(onTap: () {}, title: "title"),
            AppOutLineButton(onTap: () {}, title: "title")
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ProductDetailsAppbarWidget(),
          SliverToBoxAdapter(
            child: Container(
              // color: AppWidgetColor.fillIconButtonWidgetColor(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppWidgetColor.fillIconButtonWidgetColor(context),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowProductImageWidget(
                          imageUrl: product.image,
                          height: 300.h,
                          width: double.infinity,
                        ),
                        verticalSpace(10),
                        ShowProductRatingWidget(rating: '4.1'),
                        ShowProductTitleWidget(
                          title: product.title,
                          maxLines: 3,
                          textHeight: 50.h,
                          maxHeight: 50.h,
                        ),
                        ShowProductPriceWidget(
                          newPrice: product.newPrice,
                          oldPrice: product.oldPrice,
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
                              'Quantity',
                              style:
                                  AppTextStyles.meduimHead16w500TitleTextStyle(
                                context,
                              ),
                            ),
                            CounterAppWidget(value: 1, onChanged: (value) {})
                          ],
                        ),
                        verticalSpace(10),
                      ],
                    ),
                  ),
                  verticalSpace(10),
                  OverviewReviewTabWidget(),
                  verticalSpace(10),
                  SoldByWidget(),
                  verticalSpace(10),
                  MothersDayGiftsWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
