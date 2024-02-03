import 'dart:math' as math;

import 'package:flutter/material.dart';

class SpeedometerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Draw the outer circle (Speedometer boundary)
    canvas.drawCircle(Offset(centerX, centerY), size.width / 2, paint);

    // Draw the ticks for Low, Mid, and High sections
    _drawTicks(canvas, centerX, centerY, size.width / 2, paint, 3);

    // Draw the needle indicating the speed
    paint.strokeWidth = 5.0;
    paint.color = Colors.red;
    _drawNeedle(canvas, centerX, centerY, size.width / 2, paint,
        45.0); // Adjust the angle as needed
  }

  // Helper method to draw ticks for Low, Mid, and High sections
  void _drawTicks(Canvas canvas, double centerX, double centerY, double radius,
      Paint paint, int sections) {
    double anglePerSection = math.pi / sections;

    for (int i = 0; i < sections; i++) {
      double angle = i * anglePerSection - math.pi / 2;

      double startX = centerX + math.cos(angle) * (radius - 20);
      double startY = centerY + math.sin(angle) * (radius - 20);

      double endX = centerX + math.cos(angle) * radius;
      double endY = centerY + math.sin(angle) * radius;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  // Helper method to draw the needle
  void _drawNeedle(Canvas canvas, double centerX, double centerY, double radius,
      Paint paint, double angle) {
    double needleLength = radius - 20;

    double needleX = centerX + math.cos(angle * math.pi / 180) * needleLength;
    double needleY = centerY + math.sin(angle * math.pi / 180) * needleLength;

    canvas.drawLine(Offset(centerX, centerY), Offset(needleX, needleY), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
