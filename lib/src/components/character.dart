import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';
import '../config.dart';
import '../models/enums/action_type.dart';

class Character extends RectangleComponent with HasGameReference<Boxing> {
  Character({
    required Vector2 position,
  }) : super(
            size: Vector2(characterWidth, characterHeight),
            position: position,
            paint: Paint()
              ..color = Colors.red
              ..style = PaintingStyle.fill);

  void doAction(ActionType action) {
    switch (action) {
      case ActionType.jab:
        if (game.playerStatus.action == ActionType.block) {
          game.playerStatus.doAction(ActionType.jab, ActionType.jab.duration);
          print('jab');
        }
        break;
      case ActionType.straight:
        if (game.playerStatus.action == ActionType.block) {
          game.playerStatus.doAction(ActionType.straight, ActionType.straight.duration);
        }
        break;
      case ActionType.hook:
        if (game.playerStatus.action == ActionType.block) {
          game.playerStatus.doAction(ActionType.hook, ActionType.hook.duration);
        }
        break;
      case ActionType.uppercut:
        if (game.playerStatus.action == ActionType.block) {
          game.playerStatus.doAction(ActionType.uppercut, ActionType.uppercut.duration);
        }
        break;
      case ActionType.weave:
        if (game.playerStatus.action == ActionType.block) {
          game.playerStatus.doAction(ActionType.weave, ActionType.weave.duration);
        }
        break;
      case ActionType.duck:
        if (game.playerStatus.action == ActionType.block) {
          game.playerStatus.doAction(ActionType.duck, ActionType.duck.duration);
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

    game.playerStatus.handleActionDuration(dt);
  }
}
