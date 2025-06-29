import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_size.dart';
import 'package:flutter/material.dart';

class StepperLineWidget extends StatefulWidget {
  const StepperLineWidget({
    super.key,
    this.count = 3,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  State<StepperLineWidget> createState() => _StepperLineWidgetState();
}

class _StepperLineWidgetState extends State<StepperLineWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        widget.count,
        (index) {
          final focused = index <= widget.currentIndex;
          final last = index == widget.currentIndex;

          return Expanded(
            child: TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: last ? 0 : 1,
                  end: 1,
                ),
                curve: Curves.easeOutQuint,
                duration: const Duration(milliseconds: 700),
                builder: (context, t, _) {
                  return Container(
                    height: 5,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppSize.padding8,
                    ),
                    decoration: ShapeDecoration(
                      color: focused
                          ? Color.lerp(
                              AppColors.greyLight,
                              context.getColorByBrightness(
                                  AppColors.secondary, AppColors.white),
                              t,
                            )
                          : AppColors.greyLight,
                      shape: const StadiumBorder(),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
