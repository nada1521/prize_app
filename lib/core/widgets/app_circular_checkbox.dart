import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';

class AppCircularCheckbox extends StatefulWidget {
  const AppCircularCheckbox({
    super.key,
    required this.onChanged,
    this.initValue = false,
  });

  final void Function(bool)? onChanged;
  final bool initValue;

  @override
  State<AppCircularCheckbox> createState() => _AppCircularCheckboxState();
}

class _AppCircularCheckboxState extends State<AppCircularCheckbox> {
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
      shape: CircleBorder(),
      onChanged: (val) {
        setState(() {
          value = val == true;
          widget.onChanged?.call(val == true);
        });
      },
    );
  }
}
