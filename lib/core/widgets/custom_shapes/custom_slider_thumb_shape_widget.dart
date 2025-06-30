import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliderThumbShape extends SliderComponentShape {
  final Color fillColor;
  final Color borderColor;

  CustomSliderThumbShape({required this.fillColor, required this.borderColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(20, 20);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: 16, height: 16),
      Radius.circular(16.r),
    );

    canvas.drawRRect(rRect, fillPaint);
    canvas.drawRRect(rRect, strokePaint);
  }

  // @override
  bool shouldRepaint(CustomSliderThumbShape oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.borderColor != borderColor;
  }
}
