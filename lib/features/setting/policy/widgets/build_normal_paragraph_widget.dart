// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:prize/core/utils/helper/spacing.dart';

import 'package:prize/core/utils/resources/app_text_styles.dart';

class BuildNormalParagraphWidget extends StatelessWidget {
  const BuildNormalParagraphWidget({
    super.key,
    required this.index,
    required this.headTitle,
    required this.bodyTitle,
  });

  final int index;
  final String headTitle;
  final String bodyTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$index. $headTitle",
          style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
            fontSize: 20,
          ),
        ),
        verticalSpace(10),
        Text(bodyTitle,
            style:
                AppTextStyles.smallBodyTitle12w400TextStyle(context).copyWith(
              fontSize: 14,
            )),
      ],
    );
  }
}
