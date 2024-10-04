import 'package:boxing/src/config.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';

class Player extends RectangleComponent
    with HasGameReference<Boxing> {
  Player() : super(
      size: Vector2(playerWidth, playerHeight),
      position: Vector2(0, gameHeight),
      anchor: Anchor.bottomLeft,
      paint: Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.fill
  );
}
