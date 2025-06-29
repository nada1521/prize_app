import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:flutter/material.dart';

class PhoneNumberSuffix extends StatelessWidget {
  const PhoneNumberSuffix({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.padding5),
      child: Text(
        AppConstants.dialCodePlus,
        style: context.styleTitleMedium,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
