import 'package:flutter/material.dart';

class TextFieldModel {
  final String title;
  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  bool? isPassword;
  bool? isPhoneNumber;
  int? maxLines;
  Widget? suffixIcon;
  Widget? prefixIcon;

  TextFieldModel({
    required this.title,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.isPassword,
    this.isPhoneNumber,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines
  });
}
