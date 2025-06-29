import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({
    super.key,
    required this.onChanged,
    this.initValue = false,
  });

  final void Function(bool)? onChanged;
  final bool initValue;

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool value = widget.initValue;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      focusColor: context.colorPrimaryWhite,
      activeColor: context.colorPrimaryWhite,
      side: const BorderSide(
        color: AppColors.greyLighter,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radius6),
      ),
      onChanged: (val) {
        setState(() {
          value = val == true;
          widget.onChanged?.call(val == true);
        });
      },
    );
  }
}
