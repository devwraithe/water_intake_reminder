import 'package:flutter/material.dart';

class CupPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.5;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 5, size.height - 10.0)
      ..lineTo(size.width * 4 / 5, size.height - 10.0)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
