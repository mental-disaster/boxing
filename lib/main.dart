import 'package:boxing/src/boxing.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flame/src/events/tap_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 가로 모드로 고정
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  // 전체 화면 모드 설정
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // flutter longTapDelay 기준 변경 0.2초
  TapConfig.longTapDelay = 0.2;

  runApp(
    const GameWidget.controlled(gameFactory: Boxing.new),
  );
}
