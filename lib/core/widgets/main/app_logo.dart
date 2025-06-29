import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.color,
    this.height = 250,
    this.width,
    this.fit = BoxFit.contain,
    this.logoPath = AppImages.logo,
  });

  final Color? color;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Image.asset(
        logoPath,
        height: height,
        width: width,
        color: color ?? (context.isDarkTheme ? Colors.white : null),
        cacheWidth: 250,
        cacheHeight: 250,
        fit: fit,
      ),
    );
  }
}
