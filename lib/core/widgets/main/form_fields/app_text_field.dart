import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_font_family.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.isPassword = false,
    this.icon,
    this.iconColor,
    this.prefixIcon,
    this.iconSpace = false,
    this.labelText,
    this.hintText,
    this.errorText,
    this.controller,
    this.validator,
    this.onSubmitted,
    this.keyboardType,
    this.required = false,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.inputFormatters,
    this.textInputAction,
    this.padding = const EdgeInsetsDirectional.only(
      top: AppSize.padding12,
    ),
    this.suffixIcon,
    this.suffix,
    this.maxLength,
    this.prefix,
    this.onChanged,
    this.autoValidateMode,
    this.initialValue,
    this.filled = false,
    this.fillColor = AppColors.surfaceBox,
    this.focusNode,
    this.labelStyle = const TextStyle(),
    this.autofillHints,
    this.autofocus = false,
  });

  final bool isPassword;
  final IconData? icon;
  final Color? iconColor;
  final Widget? prefixIcon;

  /// replace icon with space
  final bool iconSpace;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool required;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry padding;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? maxLength;
  final Widget? prefix;
  final void Function(String)? onChanged;
  final AutovalidateMode? autoValidateMode;
  final String? initialValue;
  final bool filled;
  final Color? fillColor;
  final FocusNode? focusNode;
  final TextStyle? labelStyle;
  final Iterable<String>? autofillHints;
  final bool autofocus;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _hidePassword;

  void changeObscureText() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _hidePassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        onTapOutside: (pointer) {
          FocusScope.of(context).unfocus();
        },
        autofocus: widget.autofocus,
        autofillHints: widget.autofillHints,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: context.colorGreyLight,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: context.colorPrimaryWhite,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: context.colorPrimaryWhite),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: AppColors.errorColor,
              width: 1,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: AppColors.errorColor,
              width: 1.5,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: AppColors.disabled,
              width: 1.5,
            ),
          ),
          icon: widget.icon != null || widget.iconSpace
              ? Icon(
                  widget.icon,
                  size: 25,
                  color: widget.iconColor,
                )
              : null,
          errorText: widget.errorText,
          errorMaxLines: 2,
          filled: widget.filled,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          enabled: widget.enabled,
          labelText: widget.required ? null : widget.labelText,
          label: widget.required && widget.labelText != null
              ? Text.rich(
                  TextSpan(
                    text: widget.labelText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamily.poppins,
                      // color: AppColor.titleBody,
                    ),
                    children: [
                      if (widget.required)
                        const TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: AppColors.errorColor,
                            fontSize: 16,
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                    ],
                  ),
                )
              : null,
          labelStyle: widget.labelStyle,
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppSize.padding16,
            horizontal: AppSize.padding16,
          ),
          suffixIconColor: AppColors.overlay, // todo: dark mode
          prefixIcon: widget.prefixIcon,
          prefix: widget.prefix,
          // isDense: true,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _hidePassword ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.overlay, // todo: dark mode
                  ),
                  onPressed: changeObscureText,
                )
              : widget.suffixIcon,
          suffix: widget.suffix,
          counter: const SizedBox(),
        ),
        controller: widget.controller,
        obscureText: _hidePassword,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        onFieldSubmitted: widget.onSubmitted,
        textAlign: TextAlign.start,
        autovalidateMode: widget.autoValidateMode,
        textAlignVertical: TextAlignVertical.center,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        initialValue: widget.initialValue,
      ),
    );
  }
}
