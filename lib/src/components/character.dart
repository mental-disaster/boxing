import 'package:boxing/src/models/character_status.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';
import '../config.dart';
import '../models/enums/action_type.dart';

class Character extends RectangleComponent with HasGameReference<Boxing> {
  Character({
    required Vector2 position,
    required this.status,
  }) : super(
            size: Vector2(characterWidth, characterHeight),
            position: position,
            paint: Paint()
              ..color = Colors.red
              ..style = PaintingStyle.fill);

  final CharacterStatus status;

  void doAction(ActionType action) {
    switch (action) {
      case ActionType.jab:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.jab, ActionType.jab.duration);
          print('jab');
        }
        break;
      case ActionType.straight:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.straight, ActionType.straight.duration);
        }
        break;
      case ActionType.hook:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.hook, ActionType.hook.duration);
        }
        break;
      case ActionType.uppercut:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.uppercut, ActionType.uppercut.duration);
        }
        break;
      case ActionType.weave:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.weave, ActionType.weave.duration);
        }
        break;
      case ActionType.duck:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.duck, ActionType.duck.duration);
        }
        break;
      default:
    }
  }

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

  @override
  void update(double dt) {
    super.update(dt);

    status.handleActionDuration(dt);
  }
}
