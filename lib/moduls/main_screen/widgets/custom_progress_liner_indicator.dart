import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomProgressLinerIndicator extends CustomPainter {
  final double percentProgress;
  final double width;

  const CustomProgressLinerIndicator({
    required this.percentProgress,
    required this.width,
  });

  void _background(Canvas canvas, Size size, Offset end) {
    final backgroundPaint = Paint();
    backgroundPaint.style = PaintingStyle.fill;
    backgroundPaint.color = const Color.fromRGBO(255, 255, 255, 0.3);
    backgroundPaint.strokeCap = StrokeCap.round;
    backgroundPaint.strokeWidth = 4;

    canvas.drawLine(Offset.zero, end, backgroundPaint);
  }

  void _progressLine(Canvas canvas, Size size, Offset end) {
    final temperatureLinePaint = Paint();
    temperatureLinePaint.style = PaintingStyle.fill;
    temperatureLinePaint.strokeCap = StrokeCap.round;
    temperatureLinePaint.shader = ui.Gradient.linear(
      const Offset(0, 0),
      end,
      [
        const Color.fromRGBO(107, 17, 203, 1),
        const Color.fromRGBO(37, 117, 252, 1),
      ],
    );

    temperatureLinePaint.strokeWidth = 4;

    canvas.drawLine(const Offset(0, 0), end, temperatureLinePaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double progress = width * percentProgress;

    _background(canvas, size, Offset(width, 0));
    _progressLine(canvas, size, Offset(progress, 0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
