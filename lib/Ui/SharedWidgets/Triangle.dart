// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../../Core/Language/LangVariables.dart';

class Triangle extends StatelessWidget {
  Color color;
  String Title;
  Triangle({required this.color, required this.Title});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _ShapesPainter(color),
        child: Container(
            height: 50,
            width: 50,
            child: Center(
                child: Padding(
                    padding: direction==TextDirection.rtl
                        ? const EdgeInsets.only(right: 10, bottom: 16 )
                        : const EdgeInsets.only(right: 20.0, bottom: 20),
                    child: Transform.rotate(
                        angle: direction==TextDirection.rtl ? math.pi / -4 : math.pi / 4,
                        child: Text(Title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )))))));
  }
}

class _ShapesPainter extends CustomPainter {
  final Color color;
  _ShapesPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    var path = Path();
    if (direction==TextDirection.rtl) {
      path.lineTo(0, size.width);
      path.lineTo(size.height, 0);
    } else {
      path.lineTo(size.width, 0);
      path.lineTo(size.height, size.width);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
