import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/widgets/main/app_button.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 45),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.common_page_not_found.tr(),
              style: context.styleHeadline1,
            ),
            if (Navigator.canPop(context)) ...[
              const SizedBox(height: 16),
              AppButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: LocaleKeys.action_back.tr(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
