import 'dart:async';

import 'package:boxing/src/components/character_metric.dart';
import 'package:boxing/src/config.dart';
import 'package:boxing/src/models/enums/metric_type.dart';
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

    // player metrics
    playerHpBar = CharacterMetric(
      maxMetric: 100,
      currentMetric: 80,
      metricType: MetricType.hp,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, hudPadding),
      size: Vector2(MetricType.hp.width, MetricType.hp.height),
    );
    playerStaminaBar = CharacterMetric(
      maxMetric: 100,
      currentMetric: 80,
      metricType: MetricType.stamina,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, MetricType.hp.height + hudPadding * 2),
      size: Vector2(MetricType.stamina.width, MetricType.stamina.height),
    );
    playerGpBar = CharacterMetric(
      maxMetric: 100,
      currentMetric: 80,
      metricType: MetricType.gp,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, MetricType.hp.height + MetricType.stamina.height + hudPadding * 3),
      size: Vector2(MetricType.gp.width, MetricType.gp.height),
    );

    // enemy metrics
    enemyHpBar = CharacterMetric(
      maxMetric: 100,
      currentMetric: 80,
      metricType: MetricType.hp,
      anchor: Anchor.topRight,
      position: Vector2(gameWidth - hudPadding, hudPadding),
      size: Vector2(MetricType.hp.width, MetricType.hp.height),
    );
    enemyStaminaBar = CharacterMetric(
      maxMetric: 100,
      currentMetric: 80,
      metricType: MetricType.stamina,
      anchor: Anchor.topRight,
      position: Vector2(gameWidth - hudPadding, MetricType.hp.height + hudPadding * 2),
      size: Vector2(MetricType.stamina.width, MetricType.stamina.height),
    );
    enemyGpBar = CharacterMetric(
      maxMetric: 100,
      currentMetric: 80,
      metricType: MetricType.gp,
      anchor: Anchor.topRight,
      position: Vector2(gameWidth - hudPadding, MetricType.hp.height + MetricType.stamina.height + hudPadding * 3),
      size: Vector2(MetricType.gp.width, MetricType.gp.height),
    );

    add(playerHpBar);
    add(playerStaminaBar);
    add(playerGpBar);
    add(enemyHpBar);
    add(enemyStaminaBar);
    add(enemyGpBar);
  }
}