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

    game.playerStatus.addListener(_updatePlayerMetrics);
    game.enemyStatus.addListener(_updateEnemyMetrics);

    // player metrics
    playerHpBar = CharacterMetric(
      maxMetric: game.playerStatus.maxHp,
      currentMetric: game.playerStatus.currentHp,
      metricType: MetricType.hp,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, hudPadding),
      size: Vector2(MetricType.hp.width, MetricType.hp.height),
    );
    playerStaminaBar = CharacterMetric(
      maxMetric: game.playerStatus.maxStamina,
      currentMetric: game.playerStatus.currentStamina,
      metricType: MetricType.stamina,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, MetricType.hp.height + hudPadding * 2),
      size: Vector2(MetricType.stamina.width, MetricType.stamina.height),
    );
    playerGpBar = CharacterMetric(
      maxMetric: game.playerStatus.maxGp,
      currentMetric: game.playerStatus.currentGp,
      metricType: MetricType.gp,
      anchor: Anchor.topLeft,
      position: Vector2(hudPadding, MetricType.hp.height + MetricType.stamina.height + hudPadding * 3),
      size: Vector2(MetricType.gp.width, MetricType.gp.height),
    );

    // enemy metrics
    enemyHpBar = CharacterMetric(
      maxMetric: game.enemyStatus.maxHp,
      currentMetric: game.enemyStatus.currentHp,
      metricType: MetricType.hp,
      anchor: Anchor.topRight,
      position: Vector2(gameWidth - hudPadding, hudPadding),
      size: Vector2(MetricType.hp.width, MetricType.hp.height),
    );
    enemyStaminaBar = CharacterMetric(
      maxMetric: game.enemyStatus.maxStamina,
      currentMetric: game.enemyStatus.currentStamina,
      metricType: MetricType.stamina,
      anchor: Anchor.topRight,
      position: Vector2(gameWidth - hudPadding, MetricType.hp.height + hudPadding * 2),
      size: Vector2(MetricType.stamina.width, MetricType.stamina.height),
    );
    enemyGpBar = CharacterMetric(
      maxMetric: game.enemyStatus.maxGp,
      currentMetric: game.enemyStatus.currentGp,
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

  void _updatePlayerMetrics() {
    playerHpBar.currentMetric = game.playerStatus.currentHp;
    playerStaminaBar.currentMetric = game.playerStatus.currentStamina;
    playerGpBar.currentMetric = game.playerStatus.currentGp;
  }

  void _updateEnemyMetrics() {
    enemyHpBar.currentMetric = game.enemyStatus.currentHp;
    enemyStaminaBar.currentMetric = game.enemyStatus.currentStamina;
    enemyGpBar.currentMetric = game.enemyStatus.currentGp;
  }
}