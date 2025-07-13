import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({super.key});

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  final List<Map<String, String>> faqItems = [
    {
      'question': 'Question 1',
      'answer':
          'This is the detailed answer to Question 1. You can put any amount of text here, along with images, links, or other elements. This content will be hidden by default and revealed when you click on the header.',
    },
    {
      'question': 'Question 2',
      'answer':
          'Here\'s another example of expanded content for Question 2. This demonstrates how you can have multiple such widgets on a page.',
    },
    {
      'question': 'Question 3',
      'answer':
          'A third question with a detailed explanation. Flutter makes creating dynamic UIs quite straightforward!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: faqItems.map((item) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          child: ExpansionTile(
            title: Text(
              item['question']!,
              style: AppTextStyles.bodyTitle18w400TextStyle(context).copyWith(
                fontSize: 16,
              ),
            ),
            trailing: SvgPicture.asset(
              AppSvgs.arrowDown,
              color: AppWidgetColor.fillWithGrayAndDiColor(context),
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 5.w, vertical: 5.h),
                child: Text(item['answer']!,
                    style: AppTextStyles
                        .smallBodyTitle12w400WithContrastColorTextStyle(
                            context)),
              ),
            ],
            onExpansionChanged: (bool expanded) {},
          ),
        );
      }).toList(),
    );
  }
}
