import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';

/// This widget is used to display a title with a colon,
/// i,e, "Title:"
///
/// Use it when you want to display a title with a colon with custom style.
class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title:",
      style: context.styleTitleLarge,
    );
  }
}
