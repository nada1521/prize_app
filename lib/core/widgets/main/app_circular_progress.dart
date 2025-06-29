import 'dart:io';

import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppCircularProgress extends StatelessWidget {
  final bool loading;

  const AppCircularProgress({
    super.key,
    this.color = AppColors.primary,
    this.strokeWidth = 4,
    this.size,
    this.loading = true,
  });

  final Color color;
  final double strokeWidth;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (loading == false) {
      return const SizedBox.shrink();
    }

    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: Platform.isIOS ? color : null,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
