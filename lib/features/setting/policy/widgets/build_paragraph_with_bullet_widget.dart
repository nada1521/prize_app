// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class BuildParagraphWithBulletWidget extends StatelessWidget {
  const BuildParagraphWithBulletWidget({
    super.key,
    required this.index,
    required this.paragraphTitle,
    required this.paragraphData,
     this.hintText,
  });

  final int index;
  final String paragraphTitle;
  final String? hintText;
  final List<Map<String, String>> paragraphData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${index + 1}. $paragraphTitle",
          style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
            fontSize: 20,
          ),
        ),
        verticalSpace(10),
        if(hintText != null)
        Text(hintText!,
        
        style:  AppTextStyles.smallBodyTitle12w400TextStyle(context)
                              .copyWith(
                        fontSize: 14,
        ),),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: paragraphData.length,
          itemBuilder: (context, index) => _buildBulletParagraph(
            title: "${paragraphData[index]['title']}:",
            description: paragraphData[index]['description']!,
            context: context,
          ),
        ),
      ],
    );
  }

  Widget _buildBulletParagraph({
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style:
                AppTextStyles.smallBodyTitle12w400TextStyle(context).copyWith(
              fontSize: 14,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: AppTextStyles.smallBodyTitle12w400TextStyle(context)
                        .copyWith(
                      fontSize: 14,
                    ),
                  ),
                  if (description.isNotEmpty)
                    TextSpan(
                      text: description,
                      style:
                          AppTextStyles.smallBodyTitle12w400TextStyle(context)
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
    );
  }
}
