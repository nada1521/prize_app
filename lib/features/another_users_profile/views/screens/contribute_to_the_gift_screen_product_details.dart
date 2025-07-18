import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/horizontal_product_widget.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/another_users_profile/data/product_wishlist_product_progress_model.dart';
import 'package:prize/features/another_users_profile/views/screens/payment_screen.dart';
import 'package:prize/features/another_users_profile/views/widgets/contribute_anonymously_widget.dart';
import 'package:prize/features/another_users_profile/views/widgets/diagonal_progress_bar.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

class ContributeToTheGiftScreenProductDetails extends StatelessWidget {
  const ContributeToTheGiftScreenProductDetails(
      {super.key, required this.product});

  final ProductWishlistProductProgressModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Contribute the gift",
        showBackButton: true,
      ),
      body: Padding(
        padding: screensPadding,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: HorizontalProductWidget(
                    productPath: AppImages.tShirtBlack, productCount: 1)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  DiagonalProgressBar(
                    height: 12.h,
                    borderRadius: BorderRadiusGeometry.circular(24.r),
                    percent: product.precent,
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
                      Text("${product.precent * 100}%")
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  verticalSpace(20),
                  Text(
                    "Choose an anount you want to contribute towards this gift.",
                    style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(
                        context),
                  ),
                  verticalSpace(10),
                  CustomTextFieldWidget(
                    textFieldModel: TextFieldModel(
                      title: "Amount",
                      hintText: "00",
                      validator: (data) {
                        return null;
                      },
                      controller: TextEditingController(),
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    "if you want to be anonymous select contribute anonymously",
                    style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(
                        context),
                  ),
                  verticalSpace(20),
                  ContributeAnonymouslyWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: screensPadding,
        child: AppSubmitButton(
            onTap: () {
              pushTo(context, PaymentScreen());
            },
            title: "Continue"),
      ),
    );
  }
}
