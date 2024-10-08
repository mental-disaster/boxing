import 'package:boxing/src/models/enums/metric_type.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CharacterMetric extends RectangleComponent {
  CharacterMetric({
    required this.maxMetric,
    required this.currentMetric,
    required MetricType metricType,
    required Anchor anchor,
    required super.position,
    required super.size,
  })  : barColor = metricType.mainColor,
        super(anchor: anchor);

  final int maxMetric;
  final Color barColor;

  int currentMetric;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final double metricPercentage = currentMetric / maxMetric;

    double xOffset = 0;
    if (anchor == Anchor.topRight) {
      xOffset = size.x * (1 - metricPercentage);
    }

    final Rect metricRect = Rect.fromLTWH(
      xOffset,
      0,
      size.x * metricPercentage,
      size.y,
    );

    final Paint metricPaint = Paint()..color = barColor;

    canvas.drawRect(metricRect, metricPaint);
  }
}
