// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomRangeSliderShapeWidget extends RangeSliderThumbShape {
//   final Color fillColor;
//   final Color borderColor;

//   const CustomRangeSliderShapeWidget({
//     required this.fillColor,
//     required this.borderColor,
//   });

//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size(20.r, 20.r);

//   @override
//   void paint(PaintingContext context, ui.Offset offset,
//       {required RenderBox parentBox,
//       required SliderThemeData sliderTheme,
//       required Animation<double> enableAnimation,
//       required ui.Offset thumbCenter,
//       ui.Offset? secondaryOffset,
//       bool isEnabled = false,
//       bool isDiscrete = false,
//       required ui.TextDirection textDirection}) {
//     final Rect trackRect = getPreferredRect(
//       parentBox: parentBox,
//       offset: offset,
//       sliderTheme: sliderTheme,
//       isEnabled: isEnabled,
//       isDiscrete: isDiscrete,
//     );
//     final Paint backgroundPaint = Paint()
//       ..color = AppColors.containerWhite
//       ..style = PaintingStyle.fill;

//     // Draw the background
//     context.canvas.drawRRect(
//       RRect.fromRectAndCorners(
//         trackRect,
//         topLeft: const Radius.circular(12),
//         bottomLeft: const Radius.circular(12),
//         topRight: const Radius.circular(12),
//         bottomRight: const Radius.circular(12),
//       ),
//       backgroundPaint,
//     );

//     final Paint activePaint = Paint()
//       ..color = AppColors.containerBlue
//       ..style = PaintingStyle.fill;

//     final Paint inactivePaint = Paint()
//       ..color = AppColors.containerWhite
//       ..style = PaintingStyle.fill;

//     final RRect activeTrackRRect = RRect.fromRectAndCorners(
//       Rect.fromLTRB(
//           trackRect.left, trackRect.top, thumbCenter.dx, trackRect.bottom),
//       topLeft: const Radius.circular(15),
//       bottomLeft: const Radius.circular(15),
//     );

//     final RRect inactiveTrackRRect = RRect.fromRectAndCorners(
//       Rect.fromLTRB(
//           thumbCenter.dx, trackRect.top, trackRect.right, trackRect.bottom),
//       topRight: const Radius.circular(15),
//       bottomRight: const Radius.circular(15),
//     );

//     context.canvas.drawRRect(activeTrackRRect, activePaint);
//     context.canvas.drawRRect(inactiveTrackRRect, inactivePaint);

//     // Draw the border for the entire track
//     final Paint borderPaint = Paint()
//       ..color = AppColors.containerBlue
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0;

//     context.canvas.drawRRect(
//       RRect.fromRectAndCorners(
//         trackRect,
//         topLeft: const Radius.circular(12),
//         bottomLeft: const Radius.circular(12),
//         topRight: const Radius.circular(12),
//         bottomRight: const Radius.circular(12),
//       ),
//       borderPaint,
//     );
//   }
  
//   // void paint(
//   //   PaintingContext context,
//   //   Offset center, {
//   //   required Animation<double> activationAnimation,
//   //   required Animation<double> enableAnimation,
//   //   required bool isDiscrete,
//   //   required bool isEnabled,
//   //   required bool isOnTop,
//   //   required bool isPressed,
//   //   required SliderThemeData sliderTheme,
//   //   required TextDirection textDirection,
//   //   required Thumb thumb,
//   // }) {
//   //   final Canvas canvas = context.canvas;

//   //   final Paint fillPaint = Paint()
//   //     ..color = fillColor
//   //     ..style = PaintingStyle.fill;

//   //   final Paint strokePaint = Paint()
//   //     ..color = borderColor
//   //     ..style = PaintingStyle.stroke
//   //     ..strokeWidth = 2.r;

//   //   final RRect thumbRRect = RRect.fromRectAndRadius(
//   //     Rect.fromCenter(center: center, width: 16.r, height: 16.r),
//   //     Radius.circular(16.r),
//   //   );

//   //   canvas.drawRRect(thumbRRect, fillPaint);
//   //   canvas.drawRRect(thumbRRect, strokePaint);
//   // }

//   @override
//   bool shouldRepaint(CustomRangeSliderShapeWidget oldDelegate) {
//     return oldDelegate.fillColor != fillColor ||
//         oldDelegate.borderColor != borderColor;
//   }
// }

// class CustomRangeSliderValueIndicatorShape
//     extends RangeSliderValueIndicatorShape {
//   @override
//   Size getPreferredSize(
//     bool isEnabled,
//     bool isDiscrete, {
//     required TextPainter labelPainter,
//     required double textScaleFactor,
//     required Size sizeWithOverflow,
//   }) {
//     return Size(48.w, 28.h);
//   }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     required bool isOnTop,
//     required TextPainter labelPainter,
//     required RenderBox parentBox,
//     required SliderThemeData sliderTheme,
//     required TextDirection textDirection,
//     required double value,
//     required double textScaleFactor,
//     required Size sizeWithOverflow,
//   }) {
//     final Canvas canvas = context.canvas;

//     final Paint fillPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final Paint borderPaint = Paint()
//       ..color = Colors.orange
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.r;

//     final Path path = Path();
//     final double width = 48.w;
//     final double height = 28.h;

//     path.moveTo(center.dx - width / 2, center.dy - height / 2);
//     path.lineTo(center.dx + width / 2, center.dy - height / 2);
//     path.lineTo(center.dx + width / 2, center.dy);
//     path.lineTo(center.dx, center.dy + height / 2);
//     path.lineTo(center.dx - width / 2, center.dy);
//     path.close();

//     canvas.drawPath(path, fillPaint);
//     canvas.drawPath(path, borderPaint);

//     final labelOffset = Offset(
//       center.dx - labelPainter.width / 2,
//       center.dy - height / 2 - labelPainter.height / 2,
//     );
//     labelPainter.paint(canvas, labelOffset);
//   }
// }
