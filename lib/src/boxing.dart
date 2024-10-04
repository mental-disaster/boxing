import 'dart:async';

import 'package:boxing/src/components/enemy.dart';
import 'package:boxing/src/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/hud_area.dart';
import 'components/player.dart';
import 'components/ring.dart';
import 'models/character_status.dart';

class Boxing extends FlameGame
    with PanDetector {
  Boxing()
      : super(
      camera: CameraComponent.withFixedResolution(
        width: gameWidth,
        height: gameHeight,
      ),
  );

  double get width => size.x;
  double get height => size.y;

  final CharacterStatus _playerStatus = CharacterStatus(100, 100, 100, 80, 80, 80);
  CharacterStatus get playerStatus => _playerStatus;

  final CharacterStatus _enemyStatus = CharacterStatus(100, 100, 100, 50, 50, 50);
  CharacterStatus get enemyStatus => _enemyStatus;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(Ring());

    world.add(HudArea());

    world.add(Enemy());

    world.add(Player());

    debugMode = true;
  }
}