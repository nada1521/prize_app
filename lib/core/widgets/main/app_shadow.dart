import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

class AppShadow extends BoxShadow {
  const AppShadow({
    super.color = AppColors.shadowLight, // todo: change color to dark
    super.offset = const Offset(0, 3),
    super.blurRadius = 3,
    super.spreadRadius,
  });
}
