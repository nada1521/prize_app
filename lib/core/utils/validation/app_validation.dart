import 'package:easy_localization/easy_localization.dart'
    show StringTranslateExtension;
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/validation/validators/auth_validator.dart';
import 'package:prize/core/utils/validation/validators/phone_validator.dart';
import 'package:prize/core/utils/validation/validators/text_validator.dart';

/// This class is responsible for validating the input fields.
abstract class AppValidation {
  /// Check if the value is empty, then returns the error message.
  static String? requiredValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.common_validation_this_field_required.tr();
    }
    return null;
  }

  static String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.auth_placeholder_type_your_name.tr();
    } else if (!TextValidator.isNameValid(value)) {
      return LocaleKeys.auth_validation_invalid_name.tr();
    }
    return null;
  }

  static String? fullNameValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.auth_placeholder_type_your_name.tr();
    } else if (!TextValidator.isFullNameValid(value)) {
      return LocaleKeys.auth_validation_invalid_name.tr();
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.common_validation_this_field_required.tr();
    } else if (!AuthValidator.isEmailValid(value)) {
      return LocaleKeys.auth_validation_invalid_email.tr();
    }
    return null;
  }

  static String? phoneNumberValidation(String? value,
      {bool required = true, bool requiredValidation = true}) {
    if (value == null || value.trim().isEmpty) {
      if (required) {
        return LocaleKeys.common_validation_this_field_required.tr();
      } else {
        return null;
      }
    }

    // Remove leading zero if present
    String processedValue = value.trim();
    if (processedValue.startsWith("0")) {
      processedValue = processedValue.substring(1);
    }

    // Check if number is valid
    if (!PhoneValidator.isPhoneNumberValid(processedValue)) {
      if (requiredValidation) {
        return LocaleKeys.auth_validation_invalid_phone_number.tr();
      }
    }

    return null;
  }

  static String? passwordValidation(String? password) {
    if (password!.isEmpty) {
      return LocaleKeys.common_validation_this_field_required.tr();
    } else if (!AuthValidator.isPasswordLengthValid(password)) {
      return LocaleKeys.auth_validation_password_short_length_param
          .tr(args: [AuthValidator.minPasswordLength.toString()]);
    }

    return null;
  }

  static String? confirmPasswordValidation(
      String password, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return LocaleKeys.common_validation_this_field_required.tr();
    } else if (password != confirmPassword) {
      return LocaleKeys.auth_validation_passwords_not_match.tr();
    }
    return null;
  }
  static String? favouriteColorValidation(
      String color) {
    return null;
  }
  static String? paintsSizeValidation(
      String color) {
    return null;
  }
  static String? shoesSizeValidation(
      String color) {
    return null;
  }
  
}
