import 'package:flutter/services.dart';

abstract class PhoneValidator {
  static const int _minPhoneLength = 10;
  static const int maxPhoneLength = 10;

  static RegExp phoneRegExp = RegExp("^(?:[+])?[0-9]{$_minPhoneLength,$maxPhoneLength}\$");
  static RegExp phoneInputRegExp = RegExp("^(?:[+])?[0-9]*\$");
  static RegExp phoneInputBothNumbersRegExp = RegExp("^(?:[+])?[0-9٠-٩]*\$");

  static bool isPhoneNumberValid(String? phone) {
    if (phone == null) return false;
    return phoneRegExp.hasMatch(phone);
  }

  static bool isWhatsAppValid(String phone) {
    return isPhoneNumberValid(phone);
  }

  /// Allow only English numbers
  static List<TextInputFormatter> phoneInputFormatters = [
    // Allow only numbers
    FilteringTextInputFormatter.allow(phoneInputRegExp),
  ];

  /// Allow both Arabic and English numbers
  static List<TextInputFormatter> phoneInputFormattersBothNumbers = [
    // Allow only numbers (both Arabic and English)
    FilteringTextInputFormatter.allow(phoneInputBothNumbersRegExp),
  ];
}
