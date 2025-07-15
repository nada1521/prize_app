import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

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
    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
          widget.onChanged?.call(value);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: value
              ? Border.all(
                  color: AppColors.darkModeTanOrange,
                  width: 8,
                )
              : GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
        ),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: value ? AppColors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
