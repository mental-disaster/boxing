import 'dart:async';

import 'package:boxing/src/components/character_metric.dart';
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

  late CharacterMetric playerHpBar;
  late CharacterMetric playerStaminaBar;
  late CharacterMetric playerGpBar;
  late CharacterMetric enemyHpBar;
  late CharacterMetric enemyStaminaBar;
  late CharacterMetric enemyGpBar;

  @override
  FutureOr onLoad() async {
    super.onLoad();
    size = Vector2(game.width, hudHeight);

    playerHpBar = CharacterMetric(
      maxHp: 100,
      maxStamina: 100,
      maxGp: 100,
      color: hpColor,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, hudPadding),
      size: Vector2(hpBarWidth, charterMetricBarHeight),
    );
    playerStaminaBar = CharacterMetric(
      maxHp: 100,
      maxStamina: 100,
      maxGp: 100,
      color: staminaColor,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, charterMetricBarHeight + hudPadding * 2),
      size: Vector2(subBarWidth, charterMetricBarHeight),
    );
    playerGpBar = CharacterMetric(
      maxHp: 100,
      maxStamina: 100,
      maxGp: 100,
      color: gpColor,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, charterMetricBarHeight * 2 + hudPadding * 3),
      size: Vector2(subBarWidth, charterMetricBarHeight),
    );
    enemyHpBar = CharacterMetric(
      maxHp: 100,
      maxStamina: 100,
      maxGp: 100,
      color: hpColor,
      anchor: Anchor.topRight,
      position: Vector2(gameWidth - hudPadding, hudPadding),
      size: Vector2(hpBarWidth, charterMetricBarHeight),
    );
    enemyStaminaBar = CharacterMetric(
      maxHp: 100,
      maxStamina: 100,
      maxGp: 100,
      color: staminaColor,
      anchor: Anchor.topRight,
      position: Vector2(gameWidth - hudPadding, charterMetricBarHeight + hudPadding * 2),
      size: Vector2(subBarWidth, charterMetricBarHeight),
    );
    enemyGpBar = CharacterMetric(
      maxHp: 100,
      maxStamina: 100,
      maxGp: 100,
      color: gpColor,
      anchor: Anchor.topRight,
      position: Vector2(gameWidth - hudPadding, charterMetricBarHeight * 2 + hudPadding * 3),
      size: Vector2(subBarWidth, charterMetricBarHeight),
    );

    add(playerHpBar);
    add(playerStaminaBar);
    add(playerGpBar);
    add(enemyHpBar);
    add(enemyStaminaBar);
    add(enemyGpBar);
  }
}