import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/home/data/models/category_model.dart';
import 'package:prize/features/home/view/widgets/categories/single_dot_page_indicator.dart';

class AllCategoriseSectionWidget extends StatefulWidget {
  const AllCategoriseSectionWidget({super.key});

  @override
  State<AllCategoriseSectionWidget> createState() =>
      _AllCategoriseSectionWidgetState();
}

class _AllCategoriseSectionWidgetState
    extends State<AllCategoriseSectionWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<CategoryModel> _allCategories = [
    CategoryModel(
      title: LocaleKeys.home_categories_categories_section_kids_fashion.tr(),
      imagePath:
          "https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//image%201473.png",
    ),
    CategoryModel(
      title: LocaleKeys.home_categories_categories_section_mens_fashion.tr(),
      imagePath:
          "https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//24057%201.png",
    ),
    CategoryModel(
      title: LocaleKeys.home_categories_categories_section_Womens_fashion.tr(),
      imagePath:
          "https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Image.png",
    ),
    CategoryModel(
      title: LocaleKeys.home_categories_categories_section_home_kitchen.tr(),
      imagePath:
          "https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Image%20(1).png",
    ),
    CategoryModel(
      title: LocaleKeys.home_categories_categories_section_appliances.tr(),
      imagePath:
          "https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Frame%201171274955.png",
    ),
    CategoryModel(
      title: LocaleKeys.home_categories_categories_section_mobiles.tr(),
      imagePath:
          "https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//image%201472.png",
    ),
    CategoryModel(
      title: LocaleKeys.home_categories_categories_section_video_games.tr(),
      imagePath:
          "https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Image%20(2).png",
    ),
    CategoryModel(
      title: LocaleKeys.home_categories_categories_section_televisions.tr(),
      imagePath:
          "https://vfgvipnlrjvzdoxiiaoj.supabase.co/storage/v1/object/public/product_images//Image%20(3).png",
    ),
    //   CategoryModel(
    //     title: LocaleKeys.home_categories_categories_section_headphones.tr(),
    //     imagePath:
    //         "https://cdn.pixabay.com/photo/2023/06/23/11/23/ai-generated-8083323_1280.jpg",
    //   ),
    //   CategoryModel(
    //     title: LocaleKeys.home_categories_categories_section_cameras.tr(),
    //     imagePath:
    //         "https://cdn.pixabay.com/photo/2023/06/23/11/23/ai-generated-8083323_1280.jpg",
    //   ),
  ];

  List<List<CategoryModel>> get _pages {
    const int itemsPerPage = 8;
    List<List<CategoryModel>> result = [];
    for (int i = 0; i < _allCategories.length; i += itemsPerPage) {
      result.add(_allCategories.sublist(
        i,
        i + itemsPerPage > _allCategories.length
            ? _allCategories.length
            : i + itemsPerPage,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 230.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: _pages.length,
            itemBuilder: (_, pageIndex) {
              final items = _pages[pageIndex];
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: .6.h,
                ),
                itemBuilder: (context, index) {
                  final category = items[index];
                  return Column(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: AppWidgetColor.fillWidgetColor(context),
                            borderRadius: BorderRadius.circular(16.r),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(category.imagePath))),
                      ),
                      verticalSpace(8),
                      Text(
                        category.title,
                        style:
                            AppTextStyles.smallHeadTitle22w400TextStyle(context)
                                .copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        verticalSpace(8),
        SingleDotPageIndicator(
          controller: _pageController,
          pageCount: _pages.length,
        ),
      ],
    );
  }
}
