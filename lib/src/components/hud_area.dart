import 'dart:async';

import 'package:boxing/src/config.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';

class HudArea extends RectangleComponent
    with HasGameReference<Boxing> {
  HudArea()
      : super(
    anchor: Anchor.topLeft,
    paint: Paint()..color = Colors.white60,
  );

  @override
  FutureOr onLoad() async {
    super.onLoad();
    size = Vector2(game.width, hudHeight);
  }
}