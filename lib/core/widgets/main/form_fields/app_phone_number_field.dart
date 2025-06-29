import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:number_converter/number_converter.dart';
import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:prize/core/utils/validation/validators/phone_validator.dart';
import 'package:prize/core/widgets/main/form_fields/app_text_field.dart';
import 'package:prize/core/widgets/customs/phone_number_suffix.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppPhoneNumberField extends StatelessWidget {
  const AppPhoneNumberField({
    super.key,
    required this.controller,
    this.required = false,
    this.requiredValidation = true,
    this.onSubmitted,
    this.onChanged,
    this.textInputAction,
    this.labelText,
    this.errorText,
    this.prefixIcon,
    this.padding = const EdgeInsetsDirectional.only(top: AppSize.padding16),
    this.showLabel = false,
    this.icon,
  });

  final TextEditingController? controller;
  final bool required;
  final bool requiredValidation;
  final void Function(String?)? onSubmitted;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? labelText;
  final String? errorText;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry padding;
  final bool showLabel;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      icon: icon,
      prefix: context.isArabic ? null : const PhoneNumberSuffix(),
      prefixIcon: prefixIcon,
      required: required,
      onSubmitted: onSubmitted,
      padding: padding,
      onChanged: (value) {
        controller?.text = value.numbersToEnglish;
        _removeFirstZero();
        onChanged?.call(value);
      },
      labelText: showLabel ? labelText ?? LocaleKeys.auth_label_phone_number.tr() : null,
      hintText: LocaleKeys.auth_placeholder_enter_phone_number_instruction.tr(),
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: TextInputType.phone,
      inputFormatters: PhoneValidator.phoneInputFormattersBothNumbers,
      suffix: context.isArabic ? const PhoneNumberSuffix() : null,
      maxLength: PhoneValidator.maxPhoneLength,
      errorText: errorText,
      validator: (phone) => AppValidation.phoneNumberValidation(
        phone,
        required: required,
        requiredValidation: requiredValidation,
      ),
    );
  }

  void _removeFirstZero() {
    if (controller?.text.startsWith("0") == true) {
      controller?.text = controller!.text.substring(1);
    }
  }
}
