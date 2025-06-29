import 'package:flutter/material.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';

class DashLineDivider extends StatelessWidget {
  final double dashHeight;
  final double dashWith;
  final Color dashColor;

  ///  totalDashSpace/totalSpace .. from 0 : 1.
  final double fillRate;
  final Axis direction;
  final double padding;

  const DashLineDivider({
    super.key,
    this.dashHeight = 1.3,
    this.dashWith = 6.2,
    this.dashColor = AppColors.grey,
    this.fillRate = 0.61,
    this.direction = Axis.horizontal,
    this.padding = AppSize.paddingDefault20,
  });

  @override
  Widget build(BuildContext context) {
    final isHorizontal = direction == Axis.horizontal;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isHorizontal ? padding : 0,
        horizontal: isHorizontal ? 0 : padding,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxSize = direction == Axis.horizontal
              ? constraints.constrainWidth()
              : constraints.constrainHeight();
          final dCount = (boxSize * fillRate / dashWith).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: direction,
            children: List.generate(dCount, (_) {
              return SizedBox(
                width: isHorizontal ? dashWith : dashHeight,
                height: isHorizontal ? dashHeight : dashWith,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: dashColor),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
