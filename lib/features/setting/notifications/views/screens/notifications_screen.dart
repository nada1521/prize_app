import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/notifications/data/models/notification_feature_model.dart';
import 'package:prize/features/setting/notifications/views/widgets/show_notification_feature_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NotificationFeatureModel> notifcationsFeatures = [
      NotificationFeatureModel(
        title:
            LocaleKeys.setting_screen_notification_following_and_followers.tr(),
        subTitle: LocaleKeys
            .setting_screen_notification_you_just_got_a_new_follower
            .tr(),
        isEnabled: true,
      ),
      NotificationFeatureModel(
        title: LocaleKeys.setting_screen_notification_giftful_updates.tr(),
        subTitle: LocaleKeys
            .setting_screen_notification_new_features_gift_guides_etc
            .tr(),
        isEnabled: true,
      ),
      NotificationFeatureModel(
        title: LocaleKeys.setting_screen_notification_email_notifications.tr(),
        subTitle: LocaleKeys
            .setting_screen_notification_you_have_been_invited_to_collaborate
            .tr(),
        isEnabled: true,
      ),
    ];

    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.setting_screen_notification_notification.tr(),
        showBackButton: true,
      ),
      body: Padding(
        padding: screensPadding,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notifcationsFeatures.length,
          itemBuilder: (context, index) => ShowNotificationFeatureWidget(
            notifcationsFeatures: notifcationsFeatures[index],
          ),
          separatorBuilder: (context, index) => verticalSpace(16),
        ),
      ),
    );
  }
}
