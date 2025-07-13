import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_normal_paragraph_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_bullet_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_date_widget.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> useOfTheService = [
      {
        "title":
            "You agree to:\n . Use our services only for lawful purposes\n . Not misuse or interfere with the platform\n. Provide accurate and current information\n . Maintain the confidentiality of your account credentials",
        "description": "",
      },
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Terms & Conditions",
        showBackButton: true,
      ),
      body: ListView(
        padding: screensPadding,
        children: [
          verticalSpace(25),
          BuildParagraphWithDateWidget(
              headTitle: "Terms & Conditions",
              lastUpdateDate: "22 Mar 2025",
              bodyTitle:
                  "These Terms & Conditions (\"Terms\") govern your use of our mobile application. By accessing or using our services, you agree to be bound by these Terms. If you do not agree, please do not use our services."),
          verticalSpace(25),
          BuildNormalParagraphWidget(
            index: 1,
            headTitle: "Acceptance of Terms",
            bodyTitle:
                'By using our services, you confirm that you are at least [13/16/18] years old or have the permission of a legal guardian, and that you agree to comply with these Terms and all applicable laws.',
          ),
          verticalSpace(25),
          BuildParagraphWithBulletWidget(
            index: 2,
            paragraphTitle: "Use of the Service",
            paragraphData: useOfTheService,
          ),
          verticalSpace(25),
          BuildNormalParagraphWidget(
            index: 1,
            headTitle: "Intellectual Property",
            bodyTitle:
                "All content on our platform, including text, graphics, logos, images, and software, is the property of [Your Company Name] or its licensors and is protected by intellectual property laws. You may not reproduce, distribute, or create derivative works without our written consent.",
          ),
        ],
      ),
    );
  }
}
