import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:flutter/material.dart';

/// Show snackBar as toast or snackBar with different ready styles.
class SnkBar {
  static void showSuccess(
    String message, {
    int milliseconds = 1200,
    Color backgroundColor = AppColors.surfacePrimary,
    Widget? icon = const Icon(Icons.check, color: AppColors.successColor),
    SnackBarAction? action,
  }) {
    removeCurrent();
    return show(
      message,
      textColor: AppColors.successColor,
      milliseconds: milliseconds,
      backgroundColor: backgroundColor,
      icon: icon,
      action: action,
    );
  }

  static void showError(
    String? message, {
    int milliseconds = 2000,
    Color backgroundColor = AppColors.surfacePrimary,
    Widget? icon,
    SnackBarAction? action,
  }) {
    removeCurrent();
    return show(
      message ?? LocaleKeys.common_errors_error_occurred.tr(),
      textColor: AppColors.errorColor,
      milliseconds: milliseconds,
      backgroundColor: backgroundColor,
      icon: icon,
      action: action,
    );
  }

  static void showWarning(
    String message, {
    int milliseconds = 2000,
    Color backgroundColor = AppColors.warningColor,
    Widget? icon = const Icon(Icons.warning, color: AppColors.onWarningColor),
    SnackBarAction? action,
  }) {
    removeCurrent();
    return show(
      message,
      milliseconds: milliseconds,
      textColor: AppColors.onWarningColor,
      backgroundColor: backgroundColor,
      icon: icon,
      action: action,
    );
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.surfaceBox,
      textColor: AppColors.titleBody,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showToastSuccess([String? message]) {
    Fluttertoast.showToast(
      msg: message ?? LocaleKeys.common_message_done_successfully.tr(),
      backgroundColor: AppColors.successBgColor,
      textColor: AppColors.onSuccessBgColor,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showToastWarning(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.warningColor,
      textColor: AppColors.onWarningColor,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showToastError(String? message, {Duration? delay}) async {
    if (delay != null) await Future.delayed(delay);
    Fluttertoast.showToast(
      msg: message ?? LocaleKeys.common_errors_error_occurred.tr(),
      backgroundColor: AppColors.errorBgColor,
      textColor: AppColors.onErrorBgColor,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showToastNotImplemented() async {
    // return showToastError("Not implemented yet!");
    return show("⭐️ Coming soon ⭐️");
  }

  static void show(
    String message, {
    int milliseconds = 1500,
    Color backgroundColor = AppColors.surfacePrimary,
    Color? textColor = AppColors.titleBody,
    Widget? icon,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.padding16 + 2,
            vertical: AppSize.padding12,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppSize.radiusLarge14),
          ),
          child: Row(
            children: [
              if (icon != null)
                Container(
                  padding:
                      const EdgeInsetsDirectional.only(end: AppSize.padding12),
                  height: 50,
                  child: icon,
                ),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              if (action != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: AppSize.padding12),
                  child: action,
                ),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppSize.padding12,
          horizontal: AppSize.paddingLarge26,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: Duration(milliseconds: milliseconds),
      ),
    );
  }

  static void clearSnackBars() {
    return ScaffoldMessenger.of(_context).clearSnackBars();
  }

  static Future<void> clearToasts() async {
    await Fluttertoast.cancel();
  }

  static void removeCurrent() {
    return ScaffoldMessenger.of(_context).removeCurrentSnackBar();
  }

  static BuildContext get _context =>
      NavigatorManager.navigatorKey.currentContext!;
}
