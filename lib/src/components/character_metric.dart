import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CharacterMetric extends RectangleComponent {
  CharacterMetric({
    required this.maxHp,
    required this.maxStamina,
    required this.maxGp,
    required Color color,
    required Anchor anchor,
    required super.position,
    required super.size,
  }) : super(
    anchor: anchor,
    paint: Paint()
        ..color = color
  );

  final int maxHp;
  final int maxStamina;
  final int maxGp;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & size.toSize(),
        const Radius.circular(10),
      ),
      paint,
    );
  }
}