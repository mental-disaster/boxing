import 'dart:async';

import 'package:boxing/src/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import '../boxing.dart';

class Ring extends RectangleComponent
    with HasGameReference<Boxing>, DragCallbacks, TapCallbacks {
  Ring()
      : super(
    anchor: Anchor.topLeft,
    paint: Paint()..color = Colors.black,
  );

  bool _isLongTap = false;
  bool _dragCanceled = false;
  Vector2? _dragStartPosition;

  @override
  FutureOr onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }

  @override
  void onLongTapDown(TapDownEvent event) {
    _isLongTap = true;
  }
  
  @override
  void onTapUp(TapUpEvent event) {
    if (!_isLongTap) {
      print('Jap');
    } else {
      print('Straight');
    }
    _isLongTap = false;
  }

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    _dragCanceled = false;
    _dragStartPosition = event.localPosition;
    print(_dragStartPosition);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (_dragCanceled) return;

    if (event.localEndPosition.x - _dragStartPosition!.x > xDragThreshold) {
      print("drag right");
      _dragCanceled = true;
    } else if (_dragStartPosition!.x - event.localEndPosition.x > xDragThreshold) {
      print("drag left");
      _dragCanceled = true;
    } else if (event.localEndPosition.y - _dragStartPosition!.y > xDragThreshold) {
      print("drag down");
      _dragCanceled = true;
    } else if (_dragStartPosition!.y - event.localEndPosition.y > xDragThreshold) {
      print("drag up");
      _dragCanceled = true;
    }
  }
}