import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/setting/notifications/data/models/notification_feature_model.dart';

class ShowNotificationFeatureWidget extends StatefulWidget {
  const ShowNotificationFeatureWidget(
      {super.key, required this.notifcationsFeatures});

  final NotificationFeatureModel notifcationsFeatures;
  @override
  State<ShowNotificationFeatureWidget> createState() =>
      _ShowNotificationFeatureWidgetState();
}

class _ShowNotificationFeatureWidgetState
    extends State<ShowNotificationFeatureWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      title: Text(
        widget.notifcationsFeatures.title,
        style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
      ),
      subtitle: Text(
        widget.notifcationsFeatures.subTitle,
        style: AppTextStyles.smallBodyTitle12w400TextStyle(context).copyWith(
          fontSize: 14,
        ),
      ),
      trailing: Switch(
        activeColor: AppColors.white,
        activeTrackColor: AppColors.darkModeTanOrange,
        inactiveThumbColor: AppColors.darkModeTanOrange,
        inactiveTrackColor:
            AppWidgetColor.fillWidgetByLightBackgroundColor(context),
        onChanged: (s) {},
        value: widget.notifcationsFeatures.isEnabled,
      ),
    );
  }
}
