import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/horizontal_product_widget.dart';
import 'package:prize/features/another_users_profile/data/product_wishlist_product_progress_model.dart';
import 'package:prize/features/another_users_profile/views/screens/contribute_to_the_gift_product_screen.dart';
import 'package:prize/features/another_users_profile/views/screens/contribute_to_the_gift_screen_product_details.dart';
import 'package:prize/features/another_users_profile/views/widgets/diagonal_progress_bar.dart';
import 'package:prize/features/another_users_profile/views/widgets/overlapping_avatars_widget.dart';
import 'package:prize/features/home/view/widgets/other_events/days_left_widget.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

class ContributeToThePurchaseBottomSheetWidget extends StatelessWidget {
  const ContributeToThePurchaseBottomSheetWidget(
      {super.key, required this.productProgressModel});

  final ProductWishlistProductProgressModel productProgressModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: screensPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 32.w,
                height: 5.h,
                color: AppWidgetColor.dotedFillColor(context),
              ),
              verticalSpace(20),
              Text(
                productProgressModel.eventName,
                style: AppTextStyles.headTitle20w500TextStyle(context),
              ),
              verticalSpace(10),
              DaysLeftWidget(),
              verticalSpace(10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppWidgetColor.fillIconButtonWidgetColor(context),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: HorizontalProductWidget(
                    productPath: AppImages.tShirtBlack, productCount: 1),
              ),
              verticalSpace(10),
              Column(
                children: [
                  DiagonalProgressBar(
                    height: 12.h,
                    borderRadius: BorderRadiusGeometry.circular(24.r),
                    percent: productProgressModel.precent,
                    showPercentText: false,
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppSvgs.currency,
                        width: 20.w,
                        height: 20.h,
                        color: AppWidgetColor.fillWithGrayAndDiColor(context),
                      ),
                      horizontalSpace(5),
                      Text(
                        "240",
                        style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(
                                context)
                            .copyWith(
                          color: AppWidgetColor.fillWithGrayAndDiColor(context),
                        ),
                      ),
                      horizontalSpace(5),
                      Text(
                        "Funded of",
                        style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(
                                context)
                            .copyWith(
                          color: AppWidgetColor.fillWithGrayAndDiColor(context),
                        ),
                      ),
                      SvgPicture.asset(
                        AppSvgs.currency,
                        width: 20.w,
                        height: 20.h,
                        color: AppWidgetColor.fillWithGrayAndDiColor(context),
                      ),
                      horizontalSpace(5),
                      Text(
                        "644",
                        style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(
                                context)
                            .copyWith(
                          color: AppWidgetColor.fillWithGrayAndDiColor(context),
                        ),
                      ),
                      Spacer(),
                      Text("${productProgressModel.precent * 100}%")
                    ],
                  ),
                  verticalSpace(10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppWidgetColor.fillWidgetColor(context),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: OverlappingAvatars(
                            imageUrls: [
                              'https://cdn.pixabay.com/photo/2020/04/08/07/15/coffee-5016043_960_720.jpg',
                              'https://cdn.pixabay.com/photo/2020/04/08/07/15/coffee-5016043_960_720.jpg',
                              'https://cdn.pixabay.com/photo/2020/04/08/07/15/coffee-5016043_960_720.jpg',
                            ],
                          ),
                        ),
                        horizontalSpace(10),
                        Text("5 contribute to the gift"),
                      ],
                    ),
                  ),
                  verticalSpace(10),
                  AppSubmitButton(
                      onTap: () {
                        pushTo(
                            context,
                            ContributeToTheGiftScreenProductDetails(
                                product: productProgressModel));
                      },
                      title: "Continue to contribute")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
