import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_text_form_field.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/change_address/views/screens/location_screen.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

class ConfimLocationScreen extends StatelessWidget {
  const ConfimLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Confirm Location",
        showBackButton: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.mapFrame,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              //   width: 350.w,
              child: AppTextFormField(
                hintText: "Search",
                validator: (validator) {},
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  child: SvgPicture.asset(
                    AppSvgs.searchNormal,
                    color: AppWidgetColor.fillWithGrayAndDiColor(context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 50.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: SvgPicture.asset(AppSvgs.gps),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: AppSubmitButton(
          onTap: () {
            pushTo(context, LocationScreen());
          },
          title: "Confirm",
        ),
      ),
    );
  }
}
