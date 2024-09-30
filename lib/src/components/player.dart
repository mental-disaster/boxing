import 'package:boxing/src/config.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';

class Player extends RectangleComponent
    with HasGameReference<Boxing> {
  Player({
    required this.maxHp,
    required this.maxStamina,
    required this.maxGp,
  }) : super(
      size: Vector2(playerWidth, playerHeight),
      position: Vector2(0, gameHeight),
      anchor: Anchor.bottomLeft,
      paint: Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.fill
  );

  final int maxHp;
  final int maxStamina;
  final int maxGp;


}
