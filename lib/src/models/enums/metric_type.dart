import 'package:boxing/src/config.dart';
import 'package:flutter/material.dart';

enum MetricType {
  hp,
  stamina,
  gp,
}

extension MetricColors on MetricType {
  double get width {
    switch (this) {
      case MetricType.hp:
        return hudWidth * 3 / 7;
      default:
        return hudWidth / 3;
    }
  }
  double get height {
    switch (this) {
      case MetricType.hp:
        return hudHeight * 0.3;
      default:
        return hudHeight * 0.25;
    }
  }

  Color get mainColor {
    switch (this) {
      case MetricType.hp:
        return Colors.red;
      case MetricType.stamina:
        return Colors.green;
      case MetricType.gp:
        return Colors.amber;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case MetricType.hp:
        return Colors.redAccent;
      case MetricType.stamina:
        return Colors.greenAccent;
      case MetricType.gp:
        return Colors.amberAccent;
    }
  }
}