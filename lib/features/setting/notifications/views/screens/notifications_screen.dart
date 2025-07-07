import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
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
        title: "Following & Followers",
        subTitle: "You just got a new follower",
        isEnabled: true,
      ),
      NotificationFeatureModel(
        title: "Giftful Updates",
        subTitle: "New features, gift guides, etc.",
        isEnabled: true,
      ),
      NotificationFeatureModel(
        title: "Email Notifications",
        subTitle: "You have been invited to collaborate",
        isEnabled: true,
      ),
    ];

    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Change Pssword",
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
