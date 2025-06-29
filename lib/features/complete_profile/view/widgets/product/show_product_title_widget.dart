import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class ShowProductTitleWidget extends StatelessWidget {
  const ShowProductTitleWidget(
      {super.key,
      required this.title,
      required this.maxLines,
      required this.textHeight,
      required this.maxHeight,
      this.style,
      });

  final String title;
  final double textHeight, maxHeight;
  final int maxLines;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      child: SizedBox(
        height: textHeight,
        child: Text(
          title,
          maxLines: maxLines,
          style: style?? AppTextStyles.smallHeadTitle22w400TextStyle(context),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
