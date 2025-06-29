import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_images.dart';

class PlaceHolderLogo extends StatelessWidget {
  const PlaceHolderLogo({
    super.key,
    this.height,
    this.width,
    this.logoColor = AppColors.grey,
    this.logoHeight = 80,
  });

  final double? height;
  final double? width;
  final Color? logoColor;
  final double logoHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyLighter,
      height: height,
      width: width,
      alignment: Alignment.center,
      child: RepaintBoundary(
        child: Image.asset(
          AppImages.logo,
          height: logoHeight,
          color: logoColor,
          cacheWidth: 50,
          cacheHeight: 50,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
