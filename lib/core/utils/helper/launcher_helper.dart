import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:number_converter/number_converter.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/validation/validators/phone_validator.dart';
import 'package:prize/core/widgets/dialog/app_dialog.dart';
import 'package:prize/core/widgets/main/snk_bar.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'package:url_launcher/url_launcher_string.dart';

import 'navigation/navigation_manager.dart' show NavigatorManager;

/// Helper class for launching urls and phone numbers
class LauncherHelper {
  static Future<void> launchUrl(String? url) async {
    try {
      if (url == null ||
          url.isNotEmpty != true ||
          !await canLaunchUrlString(url)) {
        throw Exception(LocaleKeys.url_could_not_launch_link.tr());
      }
      await launchUrlString(url);
    } catch (e) {
      SnkBar.showToastError(LocaleKeys.url_could_not_launch_link.tr());
    }
  }

  static Future<void> launchPhoneNumber(
    String phone, {
    bool checkValidation = true,
  }) async {
    final phoneSplit = _normalizePhoneNumber(phone);
    final uri = Uri(scheme: 'tel', path: phoneSplit);
    final isValid = await _validatePhoneNumber(
      phone: phoneSplit,
      uri: uri,
      checkValidation: checkValidation,
    );
    if (isValid) {
      await url.launchUrl(uri);
    }
  }

  static Future<void> launchWhatsAppNumber(
    String phone, {
    bool checkValidation = false,
  }) async {
    final phoneSplit = _normalizeWhatsAppNumber(phone);
    final urlString = 'https://wa.me/$phoneSplit';
    final uri = Uri.parse(urlString);
    final isValid = await _validatePhoneNumber(
      phone: phoneSplit,
      uri: uri,
      checkValidation: checkValidation,
    );
    if (isValid) {
      await url.launchUrl(
        uri,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    }
  }

  static String _normalizePhoneNumber(String phone) {
    return phone.numbersToEnglish.replaceAll(' ', '').replaceFirst('+', '');
  }

  static String _normalizeWhatsAppNumber(String phone) {
    final split = _normalizePhoneNumber(phone);
    final withDialCode = split.startsWith(AppConstants.dialCode);
    if (withDialCode) return split;
    return "${AppConstants.dialCode}$split";
  }

  static FutureOr<bool> _validatePhoneNumber({
    required String phone,
    required Uri uri,
    required bool checkValidation,
  }) async {
    // check phone number validation
    if (checkValidation && !PhoneValidator.isPhoneNumberValid(phone)) {
      debugPrint("> Invalid phone number: '$phone'");
      await AppDialog.showError(
        title: LocaleKeys.auth_validation_invalid_phone_number.tr(),
        description: phone,
        icon: Icons.phonelink_erase_outlined,
      );
      return false;
    } else if (!await url.canLaunchUrl(uri)) {
      await AppDialog.showWarning(
        description: '',
        title: phone,
        icon: Icons.phone,
        iconColor: AppColors.primary,
        buttons: [
          DialogButton(
            title: LocaleKeys.action_copy.tr(),
            onPressed: () async {
              Navigator.pop(NavigatorManager.getContext());
              await Clipboard.setData(ClipboardData(text: phone));
              SnkBar.showToast(LocaleKeys.common_message_number_copied.tr());
            },
            fit: false,
          ),
        ],
      );
      return false;
    }
    return true;
  }
}
