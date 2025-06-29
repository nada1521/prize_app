import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';

class AppBottomSheetDragWidget extends StatelessWidget {
  const AppBottomSheetDragWidget({
    super.key,
    this.padding = const EdgeInsets.only(
      top: AppSize.padding16,
      bottom: 24,
    ),
    this.color = AppColors.greyLighter,
  });

  final EdgeInsets padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: padding,
        child: Container(
          height: 7,
          width: 45,
          decoration: ShapeDecoration(
            color: color,
            shape: const StadiumBorder(),
          ),
        ),
      ),
    );
  }
}
