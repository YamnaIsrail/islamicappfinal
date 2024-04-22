import 'dart:math';

import 'package:flutter/material.dart';

class StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    final Random random = Random();
    final double starSize = 2.0;
    final double spaceBetweenStars = 20.0;

    // Draw stars
    for (double i = 0; i < size.width; i += spaceBetweenStars) {
      for (double j = 0; j < size.height; j += spaceBetweenStars) {
        if (random.nextInt(10) == 0) {
          canvas.drawCircle(Offset(i, j), starSize, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
