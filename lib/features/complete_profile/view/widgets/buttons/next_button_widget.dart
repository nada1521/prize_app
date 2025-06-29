import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final currentPage = pageController.hasClients ? (pageController.page?.round() ?? 0) : 0;

    return AppSubmitButton(
      onTap: () {
        if (pageController.hasClients) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        }
      },
      title: currentPage == 0
          ? LocaleKeys.complete_profile_next_create_wishlist.tr()
          : LocaleKeys.complete_profile_next_add_items_to_wishlist.tr(),
      width: double.infinity,
    );
  }
}
