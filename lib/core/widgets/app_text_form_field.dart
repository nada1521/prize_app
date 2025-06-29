import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool? isPhoneNumber;
  final Function(CountryCode?)? onInit;
  final Widget? prefixIcon;
  final int? maxLines;
  final Color? fillColor;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.isPhoneNumber,
    this.onInit,
    this.prefixIcon,
    this.maxLines,
    this.fillColor,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _obscureText;

  TextStyle get _defaultTextStyle =>
      AppTextStyles.meduimBody16W500TitleTextStyle(context);

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.isPhoneNumber == true
          ? TextDirection.ltr
          : Directionality.of(context),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: GlobalAppWidgetsStyles.appFocusedBorder(context),
          enabledBorder: GlobalAppWidgetsStyles.appEnabledBorder(context),
          errorBorder: GlobalAppWidgetsStyles.appErrorBorder(context),
          // border: GlobalAppWidgetsStyles.appEnabledBorder(context),
          // focusedErrorBorder:AppWidgets.appErrorBorder(context),
          hintStyle: widget.hintStyle ??
              AppTextStyles.textFieldHintText16w500Style(context),
          hintText: widget.hintText,
          suffixIcon: widget.isObscureText == true
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                )
              : widget.suffixIcon,
          fillColor:
              widget.fillColor ?? AppWidgetColor.fillBackgroundColor(context),
          filled: true,
          prefixIcon: widget.isPhoneNumber == true
              ? CountryCodePicker(
                  onInit: widget.onInit,
                  onChanged: (code) {},
                  initialSelection: 'SA',
                  favorite: const ['+966', 'SA'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  dialogTextStyle: _defaultTextStyle,
                  topBarPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  searchStyle: _defaultTextStyle,
                  headerTextStyle: _defaultTextStyle,
                  textStyle: _defaultTextStyle,
                  boxDecoration: BoxDecoration(
                    color: AppWidgetColor.fillBackgroundColor(context),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                )
              : widget.prefixIcon,
        ),
        obscureText: _obscureText,
        style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
        validator: (value) {
          return widget.validator(value);
        },
        maxLines: widget.maxLines ?? 1,
      ),
    );
  }
}
