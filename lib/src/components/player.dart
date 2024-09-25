import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';

class Player extends PositionComponent
    with HasGameReference<Boxing> {
  Player({
    required super.position,
    required super.size,
  }) : super(
    anchor: Anchor.bottomLeft,
  );

  final _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(
        Rect.fromLTWH(
            0,
            0,
            size.x,
            size.y
        ),
        _paint);
  }
}
