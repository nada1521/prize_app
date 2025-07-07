import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/bottom_sheet_doted_border_widget.dart';
import 'package:prize/features/complete_profile/wishlist/view/widgets/empty_sport_wishlist_widget.dart';
import 'package:share_plus/share_plus.dart';

class SportWishlistOnProfileScreen extends StatelessWidget {
  const SportWishlistOnProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Sport Wishlist",
        suffixIcon: Row(
          children: [
            AppCircularIconButton(
              iconPath: AppSvgs.shareForward,
              onTap: () {
                Share.share(
                  'Check out this awesome product!',
                  subject: 'From Prize App',
                );

                //  showModalBottomSheet(
                //   context: context,
                //   builder: (context) {
                //     return ListView(
                //       children: [
                //         Row(
                //           children: [
                //             Image.asset(
                //               AppImages.prizeIcon,
                //               width: 41.w,
                //               height: 41.h,
                //             ),
                //             Column(
                //               children: [
                //                 Text(
                //                   "Prize",
                //                   style: AppTextStyles.headTitle24w600TextStyle(
                //                           context)
                //                       .copyWith(
                //                     fontSize: 15,
                //                   ),
                //                 ),
                //                 Text(
                //                   "prize app",
                //                   style: AppTextStyles
                //                           .bodyTitle18w400darkPeriwinkleTextStyle(
                //                               context)
                //                       .copyWith(
                //                     fontSize: 13,
                //                   ),
                //                 ),
                //               ],
                //             ),

                //             Spacer(),

                //             Container(
                //               decoration: BoxDecoration(
                //                 color: AppWidgetColor.fillIconButtonWidgetColor(context),
                //                 shape: BoxShape.circle,
                //               ),

                //               width:28.w ,
                //               height: 28.h,
                //               child: Icon(Icons.cancel),
                //             ),
                //           ],
                //         ),

                //       ],
                //     );
                //   },
                // );
              },
            ),
            horizontalSpace(10),
            AppCircularIconButton(
              iconPath: AppSvgs.menuIconButton,
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: AppWidgetColor.fillBackgroundColor(context),
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  builder: (context) => SizedBox(
                    // color: AppWidgetColor.fillBackgroundColor(context),
                    height: 150.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BottomSheetDotedBorderWidget(),
                          verticalSpace(10),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppSvgs.sportWishlistEditIconButtomSheet,
                                width: 24.w,
                                height: 24.h,
                              ),
                              horizontalSpace(15),
                              Text(
                                "Edit",
                                style: AppTextStyles
                                        .headTitle14w500WhiteAndDarkBlueTextStyle(
                                            context)
                                    .copyWith(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          verticalSpace(20),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppSvgs.sportWishlistTrushIconButtomSheet,
                                width: 24.w,
                                height: 24.h,
                              ),
                              horizontalSpace(15),
                              Text("Delete")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySportWishlistWidget(),
        ],
      ),
    );
  }
}
