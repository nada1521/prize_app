import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/cart/change_address/views/screens/change_address_screen.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      padding: screensPadding,
      constraints: BoxConstraints(
        maxHeight: 135.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address",
            style: AppTextStyles.meduimBody16W600BlackAndWhiteTitleTextStyle(
                context),
          ),
          verticalSpace(20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver to",
                    style: AppTextStyles.bodyTitle18w400TextStyle(context)
                        .copyWith(
                      fontSize: 14,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppSvgs.homeLocationIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppWidgetColor.fillWithGrayAndDiColor(context),
                      ),
                      horizontalSpace(10),
                      Text(
                        "Riyad, Saudi Arabia",
                        style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(
                            context),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  pushTo(context, ChangeAddressScreen());
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppWidgetColor.fillWithContrastColor(context),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
