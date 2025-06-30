import 'package:flutter/material.dart';

class TriangleWidget extends StatelessWidget {
  final Color fillColor;
  final Size size;

  const TriangleWidget({
    super.key,
    required this.fillColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: TrianglePainter(fillColor: fillColor),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color fillColor;

  TrianglePainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, 0) // أعلى يسار
      ..lineTo(size.width / 2, size.height) // رأس المثلث في الأسفل
      ..lineTo(size.width, 0) // أعلى يمين
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TrianglePainter oldDelegate) {
    return oldDelegate.fillColor != fillColor;
  }
}
