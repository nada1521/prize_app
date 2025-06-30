import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_disable_button.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/main/app_checkbox.dart';
import 'package:prize/features/products_filter/views/widgets/price_range_slider_widget.dart';
import 'package:prize/features/products_filter/views/widgets/rating_slider_widget.dart';

class ProductsFilterScreen extends StatelessWidget {
  const ProductsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      LocaleKeys.home_categories_categories_section_mens_fashion.tr(),
      LocaleKeys.home_categories_categories_section_Womens_fashion.tr(),
      LocaleKeys.home_categories_categories_section_home_kitchen.tr(),
      LocaleKeys.home_categories_categories_section_mobiles.tr(),
      LocaleKeys.home_categories_categories_section_video_games.tr(),
      LocaleKeys.home_categories_categories_section_televisions.tr(),
    ];

    List<String> type = [
      LocaleKeys.filter_product_men.tr(),
      LocaleKeys.filter_product_women.tr()
    ];

    RangeValues priceRange = const RangeValues(200, 1200);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: AppOutLineButton(
                    onTap: () {}, title: LocaleKeys.filter_product_reset.tr()),
              ),
              horizontalSpace(10),
              Expanded(
                flex: 2,
                child: AppFillBckgroundButton(
                    onTap: () {}, title: LocaleKeys.filter_product_apply.tr()),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Filter',
          style: AppTextStyles.headTitle24w600TextStyle(context),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    LocaleKeys.filter_product_categories.tr(),
                    style: AppTextStyles.bodyTitle18w400darkPeriwinkleTextStyle(
                            context)
                        .copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.filter_product_view_more.tr(),
                      style: TextStyle(
                        color: AppColors.darkModeTanOrange,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(5),
              SizedBox(
                height: 260.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                    children: [
                      AppCheckbox(onChanged: (v) {}),
                      Text(
                        categories[index],
                        style: AppTextStyles
                                .bodyTitle18w400darkPeriwinkleTextStyle(context)
                            .copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(15),
          Text(
            LocaleKeys.filter_product_type.tr(),
            style: AppTextStyles.bodyTitle18w400darkPeriwinkleTextStyle(context)
                .copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: type.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Row(
                children: [
                  AppCheckbox(onChanged: (v) {}),
                  Text(
                    type[index],
                  ),
                ],
              ),
            ),
          ),
          RatingSliderWidget(
            initialRating: 4.8,
            onChanged: (val) {},
          ),
          verticalSpace(15),
          PriceRangeSliderWidget(
            initialValues: priceRange,
            onChanged: (val) {},
          ),
          verticalSpace(20)
        ],
      ),
    );
  }
}
