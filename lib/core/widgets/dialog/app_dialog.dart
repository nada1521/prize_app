import 'dart:io';

import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/extensions/text_style_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';

import '../main/app_button.dart';
import 'base/dialog_shape.dart';

part 'dialog_button.dart';

part 'base/dialog_action_container.dart';

part 'base/dialog_animated_icon.dart';

part 'base/android_icon_container.dart';

part 'base/android_dialog_body.dart';

part 'base/cupertino_dialog_body.dart';

class AppDialog {
  AppDialog._();

  static Future<void> showWarning({
    String? title,
    Color? titleColor,
    String? description,
    IconData? icon = Icons.error_outline,
    Color? iconColor = Colors.amber,
    List<DialogButton> buttons = const [],

    /// [FALSE] for allow dismissible,
    /// [TRUE] for preventing dismissible & prevent back behavior.
    bool preventDismissible = false,
  }) async {
    assert(title != null || description != null,
        'Title and body cannot be null at the same time');
    if (Platform.isIOS) {
      return await showCupertinoDialog(
        context: _context,
        barrierDismissible: !preventDismissible,
        builder: (BuildContext context) {
          return PopScope(
            canPop: !preventDismissible,
            child: CupertinoAlertDialog(
              actions: buttons,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // icon
                  _DialogAnimatedIcon(icon: icon, color: iconColor),
                  AppSize.padding12.spaceHeight,
                  _CupertinoDialogBody(
                      title: title,
                      description: description,
                      titleColor: titleColor),
                ],
              ),
            ),
          );
        },
      );
    }

    return await showDialog(
      context: _context,
      barrierDismissible: !preventDismissible,
      builder: (BuildContext context) {
        return PopScope(
          canPop: !preventDismissible,
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: context.colorWhiteOrNull,
            actionsPadding: const EdgeInsets.only(
              bottom: AppSize.padding12,
              top: AppSize.padding5,
            ),
            actions: [_DialogActionContainer(buttons: buttons)],
            shape: DialogShape(),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // icon
                  _DialogAndroidIconContainer(
                    backgroundColor: iconColor,
                    child: _DialogAnimatedIcon.android(icon: icon),
                  ),
                  _AndroidDialogBody(
                      title: title,
                      description: description,
                      titleColor: titleColor),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showSuccess({
    String? title,
    Color? titleColor,

    /// Default is "Done successfully"
    String? description,
    IconData? icon = Icons.check_circle,
    Color? backgroundColor = AppColors.greenColor,
    List<DialogButton> buttons = const [],

    /// [FALSE] for allow dismissible,
    /// [TRUE] for preventing dismissible & prevent back behavior.
    bool preventDismissible = false,
  }) async {
    showWarning(
      title: title,
      titleColor: titleColor,
      description:
          description ?? LocaleKeys.common_message_done_successfully.tr(),
      icon: icon,
      iconColor: backgroundColor,
      buttons: buttons,
      preventDismissible: preventDismissible,
    );
  }

  static Future<void> showError({
    String? title,
    Color? titleColor,

    /// Error description. Default is "Unexpected error occurred"
    String? description,
    IconData? icon = Icons.error,
    Color? backgroundColor = AppColors.errorColor,
    List<DialogButton> buttons = const [],

    /// [FALSE] for allow dismissible,
    /// [TRUE] for preventing dismissible & prevent back behavior.
    bool preventDismissible = false,
  }) async {
    showWarning(
      title: title,
      titleColor: titleColor,
      description: description ??
          LocaleKeys.common_errors_unexpected_error_occurred.tr(),
      icon: icon,
      iconColor: backgroundColor,
      buttons: buttons,
      preventDismissible: preventDismissible,
    );
  }

  static BuildContext get _context =>
      NavigatorManager.navigatorKey.currentContext!;
}
