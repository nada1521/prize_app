import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/wallet/view/screen/charge_wallet_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(title: "Wallet"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(children: [
              Container(
                padding: EdgeInsets.all(18),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "balance",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    verticalSpace(10),
                    Text(
                      "0 LE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(15),
                    InkWell(
                      onTap: () => pushTo(
                        context,
                        ChargeWalletScreen(),
                      ),
                      child: Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "charge",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                            SvgPicture.asset(
                              AppSvgs.wallet,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
            verticalSpace(12),
            Text(
              "Transactions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(50),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 35,
                    backgroundColor: AppColors.white,
                    child: SvgPicture.asset(
                      AppSvgs.wallet,
                      width: 35.w,
                      height: 35.h,
                    ),
                  ),
                  verticalSpace(17),
                  Text("You have not made any\ntransactions before.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles
                              .headTitle14w500WhiteAndDarkBlueTextStyle(context)
                          .copyWith(color: Colors.blueGrey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
