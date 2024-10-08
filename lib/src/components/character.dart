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
              ..style = PaintingStyle.fill){
    status.addListener(_onStatusChanged);
  }

  final CharacterStatus status;

  void _onStatusChanged() {
    if (status.actionPhase == ActionPhase.attack) {
      game.enemyStatus.takeDamage(10, 10, 10);
    }
  }

  void doAction(ActionType action) {
    switch (action) {
      case ActionType.jab:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.jab);
          print('jab');
        }
        break;
      case ActionType.straight:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.straight);
        }
        break;
      case ActionType.hook:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.hook);
        }
        break;
      case ActionType.uppercut:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.uppercut);
        }
        break;
      case ActionType.weave:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.weave);
        }
        break;
      case ActionType.duck:
        if (status.action == ActionType.block) {
          status.doAction(ActionType.duck);
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

  @override
  void onRemove() {
    status.removeListener(_onStatusChanged);
    super.onRemove();
  }
}
