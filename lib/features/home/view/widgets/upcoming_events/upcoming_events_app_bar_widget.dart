import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/features/home/view/widgets/appbar/home_features_appbar.dart';

class UpComingEventsAppBar extends StatelessWidget {
  const UpComingEventsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeFeaturesAppbar(
      featureLable:LocaleKeys.home_upcomming_events_appbar_title.tr(),
      lableIcon: SvgPicture.asset(AppSvgs.calendarWithDay),
    );
  }
}
