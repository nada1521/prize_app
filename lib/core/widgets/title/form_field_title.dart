import 'package:prize/core/utils/resources/app_size.dart' show AppSize;
import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';

/// Title for form fields
class FormFieldTitle extends StatelessWidget {
  const FormFieldTitle({
    super.key,
    required this.title,
    this.suffixHint,
  });

  final String title;
  final String? suffixHint;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: context.styleTitleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (suffixHint != null)
            TextSpan(
              text: ' ($suffixHint)',
              style: context.styleSubtitle14,
            ),
        ],
      ),
    );
  }
}

/// Title for form fields, aligned to the [CenterStart]
class FormFieldTitleAligned extends StatelessWidget {
  const FormFieldTitleAligned({
    super.key,
    required this.title,
    this.margin,
    this.suffixHint,
  });

  /// Title for form fields, aligned to the [CenterStart],
  /// with a top **margin** space with a value of [AppSize.paddingDefault20]
  const FormFieldTitleAligned.topSpace({
    super.key,
    required this.title,
    this.suffixHint,
    this.margin = const EdgeInsets.only(top: AppSize.paddingDefault20),
  });

  final String title;
  final String? suffixHint;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: margin,
      child: FormFieldTitle(
        title: title,
        suffixHint: suffixHint,
      ),
    );
  }
}
