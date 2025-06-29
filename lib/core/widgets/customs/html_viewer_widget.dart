import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:prize/core/utils/resources/app_size.dart';

class HtmlViewerWidget extends StatelessWidget {
  const HtmlViewerWidget({
    super.key,
    required this.title,
    required this.html,
  });

  final String title;
  final String html;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSize.paddingDefault20,
          ),
          child: HtmlWidget(
            html,
          ),
        ),
      ),
    );
  }
}
