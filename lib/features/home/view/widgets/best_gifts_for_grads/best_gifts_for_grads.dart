import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/features/home/view/widgets/appbar/home_features_appbar.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/all_mothers_day_gifts_widget.dart';

class BestGiftsForGrads extends StatelessWidget {
  const BestGiftsForGrads({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary.withOpacity(.1),
      child: Column(
        children: [
          HomeFeaturesAppbar(featureLable: LocaleKeys.home_best_gifts_forGrads_appbar_title_best_gifts.tr()),
          SizedBox(
            width: double.infinity,
            height: 350.h,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
              child: AllMothersDayGiftsWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
