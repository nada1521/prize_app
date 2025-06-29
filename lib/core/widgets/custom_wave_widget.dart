import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class _CustomWavePainter extends CustomPainter {
  final Color primaryColor;
  final Color primaryLightColor;

  _CustomWavePainter({
    required this.primaryColor,
    required this.primaryLightColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint_0 = Paint()
      ..color = primaryLightColor
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.8615685);
    path_0.cubicTo(size.width * 0.1488372, size.height * 1.007536, size.width * 0.3711886, size.height * 0.8833380, size.width * 0.5377261,
        size.height * 0.6759699);
    path_0.cubicTo(size.width * 0.7552972, size.height * 0.4049679, size.width * 0.8528424, size.height * 0.5185599, size.width * 0.8820413,
        size.height * 0.5528886);
    path_0.cubicTo(
        size.width * 0.9718346, size.height * 0.6581077, size.width, size.height * 0.8258443, size.width, size.height * 0.8258443);
    path_0.lineTo(size.width, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    final paint_1 = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    Path path_1 = Path();
    path_1.moveTo(size.width, 0);
    path_1.lineTo(0, 0);
    path_1.lineTo(0, size.height * 0.7169969);
    path_1.cubicTo(size.width * 0.1488372, size.height * 0.8384036, size.width * 0.3711886, size.height * 0.7351382, size.width * 0.5377261,
        size.height * 0.5623779);
    path_1.cubicTo(size.width * 0.7552972, size.height * 0.3368685, size.width * 0.8528424, size.height * 0.4314820, size.width * 0.8820413,
        size.height * 0.4599498);
    path_1.cubicTo(
        size.width * 0.9718346, size.height * 0.5475858, size.width, size.height * 0.6871337, size.width, size.height * 0.6871337);
    path_1.lineTo(size.width, 0);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomWaveWidget extends StatelessWidget {
  const CustomWaveWidget({
    super.key,
    this.height = 170,
    this.width = double.infinity,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
        painter: _CustomWavePainter(
          primaryColor: context.colorPrimary,
          primaryLightColor: context.colorPrimaryLight,
        ),
      ),
    );
  }
}
