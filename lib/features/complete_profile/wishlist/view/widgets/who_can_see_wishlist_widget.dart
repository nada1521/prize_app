import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/custom_radio_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum WishlistVisibility { public, private }

class WhoCanSeeWishlistWidget extends StatefulWidget {
  const WhoCanSeeWishlistWidget({super.key});

  @override
  State<WhoCanSeeWishlistWidget> createState() =>
      _WhoCanSeeWishlistWidgetState();
}

class _WhoCanSeeWishlistWidgetState extends State<WhoCanSeeWishlistWidget> {
  WishlistVisibility? _selectedVisibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys
              .complete_profile_create_wishlist_widget_who_can_see_your_wishlist
              .tr(),
          style: AppTextStyles.meduimBody16W500TitleTextStyle(context).copyWith(
            fontSize: 14,
          ),
        ),
        verticalSpace(15),
        WishlistOptionTile(
          value: WishlistVisibility.public,
          groupValue: _selectedVisibility,
          onChanged: (val) => setState(() => _selectedVisibility = val),
          title: LocaleKeys.complete_profile_create_wishlist_widget_public.tr(),
          subtitle: LocaleKeys
              .complete_profile_create_wishlist_widget_public_placeholder
              .tr(),
        ),
        WishlistOptionTile(
          value: WishlistVisibility.private,
          groupValue: _selectedVisibility,
          onChanged: (val) => setState(() => _selectedVisibility = val),
          title:
              LocaleKeys.complete_profile_create_wishlist_widget_private.tr(),
          subtitle: LocaleKeys
              .complete_profile_create_wishlist_widget_private_placeholder
              .tr(),
        ),
      ],
    );
  }
}

class WishlistOptionTile extends StatelessWidget {
  final WishlistVisibility value;
  final WishlistVisibility? groupValue;
  final ValueChanged<WishlistVisibility?> onChanged;
  final String title;
  final String subtitle;

  const WishlistOptionTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      leading: CustomRadioOption<WishlistVisibility>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      dense: true,
      titleAlignment: ListTileTitleAlignment.top,
      title: Text(
        title,
        style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.meduimBody16W500TitleTextStyle(context),
      ),
    );
  }
}
