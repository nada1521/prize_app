import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/change_address/views/widget/location_form.dart';
import 'package:prize/features/cart/change_address/views/widget/piked_adress_widget.dart';
import 'package:prize/features/cart/change_address/views/widget/selection_location_item.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

enum LocationType { home, work, other }

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationType selectedType = LocationType.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.core_location.tr(),
        showBackButton: true,
      ),
      body: Padding(
        padding: screensPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              PikedAdressWidget(),
              verticalSpace(20),
              Row(
                children: [
                  SelectableLocationItem(
                    isSelected: selectedType == LocationType.home,
                    label: LocaleKeys.core_home.tr(),
                    iconPath: AppSvgs.locationHomeIcon,
                    onTap: () {
                      setState(() {
                        selectedType = LocationType.home;
                      });
                    },
                  ),
                  horizontalSpace(10),
                  SelectableLocationItem(
                    isSelected: selectedType == LocationType.work,
                    label: LocaleKeys.location_screen_work.tr(),
                    iconPath: AppSvgs.briefcase,
                    onTap: () {
                      setState(() {
                        selectedType = LocationType.work;
                      });
                    },
                  ),
                  horizontalSpace(10),
                  SelectableLocationItem(
                    isSelected: selectedType == LocationType.other,
                    label: LocaleKeys.location_screen_label_other.tr(),
                    iconPath: AppSvgs.moreIcon,
                    onTap: () {
                      setState(() {
                        selectedType = LocationType.other;
                      });
                    },
                  ),
                ],
              ),
              verticalSpace(24),
              LocationForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: AppSubmitButton(
          onTap: () {
            // use selectedType here
          },
          title: LocaleKeys.core_confirm.tr(),
        ),
      ),
    );
  }
}
