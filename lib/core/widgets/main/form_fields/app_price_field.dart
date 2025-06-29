import 'package:number_converter/number_converter.dart';
import 'package:prize/core/utils/validation/validators/price_validator.dart';
import 'package:prize/core/widgets/main/form_fields/app_text_field.dart';
import 'package:prize/core/widgets/customs/price_suffix.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppPriceField extends StatelessWidget {
  const AppPriceField({
    super.key,
    required this.controller,
    this.required = false,
    this.onSubmitted,
    this.onChanged,
    this.textInputAction,
    this.labelText,
    this.hintText = 'XX',
    this.showPrefixIcon = false,
    this.validator,
    this.autoValidateMode,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final bool required;
  final void Function(String?)? onSubmitted;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? labelText;
  final String? hintText;
  final bool showPrefixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    // final isRtl = context.read<LanguageBloc>().state.appLanguage!.isRtl;
    return AppTextField(
      // prefix: isRtl ? null : const PriceSuffix(),
      // suffix: isRtl ? const PriceSuffix() : null,
      required: required,
      iconSpace: false,
      onSubmitted: onSubmitted,
      onChanged: (value) {
        final price = value.numbersToEnglish;
        controller?.text = price;
        onChanged?.call(price);
      },
      enabled: enabled,
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: const TextInputType.numberWithOptions(),
      inputFormatters: PriceValidator.priceInputFormattersBothNumbers,
      suffix: const PriceSuffix(),
      autoValidateMode: autoValidateMode,
      validator: validator ??
          (value) {
            if (value!.trim().isEmpty && required) {
              return LocaleKeys.common_validation_this_field_required.tr();
            }

            return null;
          },
    );
  }
}
