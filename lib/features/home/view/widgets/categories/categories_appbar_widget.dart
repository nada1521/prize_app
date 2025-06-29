import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/features/home/view/widgets/appbar/home_features_appbar.dart';

class CategoriesAppbarWidget extends StatelessWidget {
  const CategoriesAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeFeaturesAppbar(featureLable: LocaleKeys.home_categories_appbar_title.tr());
  }
}
