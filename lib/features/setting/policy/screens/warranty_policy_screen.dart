import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_normal_paragraph_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_bullet_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_date_widget.dart';

class WarrantyPolicyScreen extends StatelessWidget {
  const WarrantyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> informationWeCollect = [
      {
        "title": "Personal Information:",
        "description": "Name, email address, phone number, etc.",
      },
      {
        "title": "Usage Data:",
        "description":
            "How you interact with our app or website, such as pages visited, time spent, clicks, etc.",
      },
      {
        "title": "Device Information:",
        "description":
            "IP address, browser type, device type, operating system, etc.",
      },
      {
        "title": "Cookies and Tracking Technologies:",
        "description":
            "We may use cookies or similar tracking tools to enhance user experience.",
      },
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Warranty Policy",
        showBackButton: true,
      ),
      body: ListView(
        padding: screensPadding,
        children: [
          verticalSpace(25),
          BuildParagraphWithDateWidget(
              headTitle: "Warranty Policy",
              lastUpdateDate: "22 Mar 2025",
              bodyTitle:
                  "we are committed to protecting your personal information and your right to privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information"),
          verticalSpace(25),
          BuildParagraphWithBulletWidget(
            index: 1,
            paragraphTitle: "Information We Collect",
            paragraphData: informationWeCollect,
            hintText: "We may collect the following types of information:",
          ),
          verticalSpace(25),
          BuildNormalParagraphWidget(
            index: 2,
            headTitle: "How We Use Your Information",
            bodyTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
          )
        ],
      ),
    );
  }
}
