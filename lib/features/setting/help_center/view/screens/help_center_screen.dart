import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/help_center/view/widgets/chat_with_us_widget.dart';
import 'package:prize/features/setting/help_center/view/widgets/expanded_widget.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Help Center",
        showBackButton: true,
      ),
      body: ListView(
        padding: screensPadding,
        shrinkWrap: true,
        children: [
          ChatWithUsWidget(),
          verticalSpace(10),
          ExpandedWidget(),
          ],
      ),
    );
  }
}
