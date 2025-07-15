import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_outline_icon_button.dart';

class PikedAdressWidget extends StatelessWidget {
  const PikedAdressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppWidgetColor.outlineWidgetColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                AppImages.pikedAddressImage,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              height: 70.h,
              decoration: BoxDecoration(
                color: AppWidgetColor.fillBackgroundColor(context),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 250.w,
                          ),
                          child: Text(
                            "81 algumhuryia street, 123 montaser street",
                            style:
                                AppTextStyles.headTitle24w600TextStyle(context)
                                    .copyWith(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        verticalSpace(8),
                        Text(
                          "Mansoura, Dakhlia",
                          style: AppTextStyles.bodyTitle18w400TextStyle(context)
                              .copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: AppOutlineIconButton(
                      height: 40.h,
                      width: 40.w,
                      onTap: () {},
                      border: GlobalAppWidgetsStyles.containerGrayBoxBorder(
                          context),
                      icon: SvgPicture.asset(
                        AppSvgs.editPrfileIconButton,
                        color: AppWidgetColor.fillWithOppositeColor(context),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
