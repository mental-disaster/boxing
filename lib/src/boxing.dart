import 'dart:async';

import 'package:boxing/src/components/player.dart';
import 'package:boxing/src/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class Boxing extends FlameGame
    with PanDetector {
  Boxing()
      : super(
      camera: CameraComponent.withFixedResolution(
          width: gameWidth,
          height: gameHeight
      ),
  );

  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.bottomLeft;

    world.add(Player(position: Vector2(0, 0), size: Vector2(300, 500)));
  }
}