import 'dart:ffi';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';
import '../config.dart';

class Character extends RectangleComponent
    with HasGameReference<Boxing> {
  Character({
    required Vector2 position,
  }) : super(
      size: Vector2(characterWidth, characterHeight),
      position: position,
      paint: Paint()
        ..color = Colors.red
        ..style = PaintingStyle.fill
  );

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.x, size.y),
        paint,
    );
  }
}