import 'dart:math';

import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class CupPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var radius = min(centerX, centerY);

    var center = Offset(centerX, centerY);

    Paint secProgressBrush = Paint()
      ..color = Constants.primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;

    Paint fillBrush = Paint()
      ..color = Colors.grey[300]!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    Paint progressBrush = Paint()
      ..color = Constants.primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var progressCounter = 2 * pi * (70 / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius + 18),
      -pi / 2,
      progressCounter,
      false,
      secProgressBrush,
    );
    canvas.drawCircle(center, radius, fillBrush);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      progressCounter,
      false,
      progressBrush,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
