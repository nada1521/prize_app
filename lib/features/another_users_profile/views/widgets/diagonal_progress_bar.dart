// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class DiagonalProgressBar extends StatelessWidget {
  final double percent;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final bool? showPercentText;

  const DiagonalProgressBar({
    super.key,
    required this.percent,
    required this.height,
    required this.borderRadius,
    this.showPercentText,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double fullWidth = constraints.maxWidth;
        final double progressWidth = fullWidth * percent;

        return ClipRRect(
          borderRadius: borderRadius,
          child: Stack(
            children: [
              // الخلفية (اللون الفاتح)
              Container(
                width: fullWidth,
                height: height,
                color: AppColors.regentBlue.withOpacity(0.2),
              ),

              // شريط التقدم
              Container(
                width: progressWidth,
                height: height,
                color: AppColors.regentBlue,
              ),

              // الخطوط المائلة
              Positioned(
                child: SizedBox(
                  height: height,
                  width: progressWidth,
                  child: Stack(
                    children: List.generate(20, (index) {
                      return Positioned(
                        left: index * 20,
                        child: Transform.rotate(
                          angle: -0.5,
                          child: Container(
                            width: 10,
                            height: 40,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // النص في المنتصف
              showPercentText != null && showPercentText == false
                  ? SizedBox.shrink()
                  : Positioned.fill(
                      child: Center(
                        child: Text(
                          "${(percent * 100).toInt()}%",
                          style: AppTextStyles.smallBodyTitle12w500TextStyle(
                                  context)
                              .copyWith(
                            color: percent >= 0.5
                                ? Colors.white
                                : AppColors.regentBlue,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
