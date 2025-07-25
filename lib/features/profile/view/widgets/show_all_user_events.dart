import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/profile/data/personal_event_model.dart';
import 'package:prize/features/shop/views/screens/shop_products_screen.dart';

class ShowAllUserEvents extends StatelessWidget {
  const ShowAllUserEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PersonalEventModel> commingEvent = [
      PersonalEventModel(
        image: AppImages.gaduationImage,
        title: LocaleKeys.profile_screen_graduation.tr(),
        date: DateTime.now(),
      ),
      PersonalEventModel(
        image: AppImages.birthday,
        title: LocaleKeys.profile_screen_birthday.tr(),
        date: DateTime.now(),
      ),
      PersonalEventModel(
        image: AppImages.wedding,
        title: LocaleKeys.profile_screen_wedding.tr(),
        date: DateTime.now(),
      ),
      PersonalEventModel(
        image: AppImages.wedding,
        title: LocaleKeys.profile_screen_wedding.tr(),
        date: DateTime.now(),
      ),
    ];
    return GridView.builder(
      shrinkWrap: true,
      itemCount: commingEvent.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: .65),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            pushTo(context, ShopProductsScreen());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                commingEvent[index].image,
                width: 110.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
              FittedBox(
                child: Text(
                  commingEvent[index].title,
                  style: AppTextStyles.headTitle14w500WhiteAndDarkBlueTextStyle(
                      context),
                ),
              ),
              Text(
                DateFormat("EEE, M/d/y").format(commingEvent[index].date),
                style: AppTextStyles.smallBodyTitle12w500TextStyle(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
