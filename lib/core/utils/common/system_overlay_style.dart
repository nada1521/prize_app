import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kSystemOverlayStyle = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: AppColors.surfacePrimary,
  systemNavigationBarDividerColor: AppColors.surfacePrimary,
  // Status bar brightness (optional)
  statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light, // For iOS (dark icons)
);

const kDarkSystemOverlayStyle = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: AppColors.surfacePrimary,
  systemNavigationBarDividerColor: AppColors.surfacePrimary,
  // Status bar brightness (optional)
  statusBarIconBrightness: Brightness.light, // For Android (light icons)
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark, // For iOS (light icons)
);
