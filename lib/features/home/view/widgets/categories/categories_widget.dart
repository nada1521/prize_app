import 'package:flutter/material.dart';
import 'package:prize/features/home/view/widgets/categories/all_categorise_section_widget.dart';
import 'package:prize/features/home/view/widgets/categories/categories_appbar_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesAppbarWidget(),
        AllCategoriseSectionWidget(),
      ],
    );
  }
}
