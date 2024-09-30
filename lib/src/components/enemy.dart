import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';
import '../config.dart';

class Enemy extends RectangleComponent
    with HasGameReference<Boxing> {
  Enemy()
      : super(
    size: Vector2(playerWidth, playerHeight),
    position: Vector2(gameWidth, hudHeight),
    anchor: Anchor.topRight,
    paint: Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
  );
}