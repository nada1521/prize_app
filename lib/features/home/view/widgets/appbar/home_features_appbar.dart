import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_icon_widget.dart';

class HomeFeaturesAppbar extends StatelessWidget {
  const HomeFeaturesAppbar(
      {super.key, required this.featureLable, this.lableIcon});

  final String featureLable;
  final SvgPicture? lableIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Row(
        children: [
          lableIcon != null ? lableIcon! : SizedBox(),
          horizontalSpace(4),
          Text(
            featureLable,
            style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
              fontSize: 16,
            ),
          ),
          Spacer(),
          AppIconWidget(
            svgIconPath: AppSvgs.arrowRight,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
