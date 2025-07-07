// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class BuildParagraphWithDateWidget extends StatelessWidget {
  const BuildParagraphWithDateWidget({
    super.key,
    required this.headTitle,
    required this.lastUpdateDate,
    required this.bodyTitle,
  });

  final String headTitle;
  final String lastUpdateDate;
  final String bodyTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headTitle,
          style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
            fontSize: 20,
          ),
        ),
        Text(
          "Last Update: $lastUpdateDate",
          style: AppTextStyles.smallBodyTitle12w400TextStyle(context).copyWith(
            fontSize: 14,
          ),
        ),
        verticalSpace(15),
        Text(
          bodyTitle,
          style: AppTextStyles.smallBodyTitle12w400TextStyle(context).copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
