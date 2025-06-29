import 'package:flutter/material.dart';
import 'package:prize/core/utils/helper/my_text_direction.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/utils/resources/app_theme_text_styles.dart';


class PriceSuffix extends StatelessWidget {
  const PriceSuffix({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.padding5),
      child: Text(
        "getSettings().currencySymbol",
        style: Theme.of(context).textTheme.mediumFontStyle(context),
        textAlign: TextAlign.center,
        textDirection: MyTextDirection.ltr,
      ),
    );
  }
}
