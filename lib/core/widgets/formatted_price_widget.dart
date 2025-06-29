import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/extensions/price_formatter_extension.dart';


/// Displays a numeric amount formatted as a price with currency symbol.
///
/// Use this widget to show monetary values consistently,
/// applying the app’s current locale and currency settings.
class FormattedPriceWidget extends StatelessWidget {
  const FormattedPriceWidget({
    super.key,
    required this.amount,
    this.color,
    this.fontSize = 22,
  });

  const FormattedPriceWidget.big({
    super.key,
    required this.amount,
    this.color,
    this.fontSize = 38,
  });

  final double amount;
  final Color? color;

  /// Used to adjust the font size of the all widget
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: amount.formatPrice(),
        style: context.styleTitleLargeBold.copyWith(
          color: color ?? AppColors.secondary,
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: " ${"getSettings().currencySymbol"}",
            style: context.styleBodyLargeLight.copyWith(
              color: color ?? AppColors.secondary,
              fontSize: fontSize * 0.70,
            ),
          ),
        ],
      ),
    );
  }
}
