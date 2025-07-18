import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class VoucherTextColumn extends StatelessWidget {
  const VoucherTextColumn({
    super.key,
    required this.title,
    required this.subTitle,
    this.isSvgPicture = false,
  });
  final String title;
  final String subTitle;
  final bool isSvgPicture;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Row(
          children: [
            Text(
              subTitle,
              style:
                  AppTextStyles.smallBodyTitle12w400TextStyle(context).copyWith(
                color: AppColors.darkBlue,
              ),
            ),
            SizedBox(width: 4),
            isSvgPicture == true
                ? SvgPicture.asset(
                    AppSvgs.pointsIcon,
                    width: 20,
                  )
                : SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
