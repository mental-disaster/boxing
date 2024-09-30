import 'package:flutter/material.dart';

const gameWidth = 1900.0;
const gameHeight = 900.0;
const playerWidth = gameWidth / 6;
const playerHeight = gameHeight * 0.5;
const hudHeight = gameHeight * 0.3;
const hudPadding = hudHeight * 0.1;
const hpBarWidth = gameWidth * 3 / 7 - hudPadding;
const subBarWidth = gameWidth / 3 - hudPadding;
const charterMetricBarHeight = hudHeight / 3 - hudPadding;
const xDragThreshold = gameWidth / 8;
const yDragThreshold = gameHeight / 4;
const hpColor = Colors.red;
const staminaColor = Colors.green;
const gpColor = Colors.amber;