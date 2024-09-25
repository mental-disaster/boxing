import 'package:boxing/src/boxing.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 가로 모드로 고정
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  // 전체 화면 모드 설정
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  final game = Boxing();
  runApp(GameWidget(game: game));
}