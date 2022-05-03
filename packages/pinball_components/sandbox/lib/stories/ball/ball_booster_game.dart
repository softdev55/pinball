import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:sandbox/common/common.dart';

class BallBoosterGame extends LineGame {
  static const description = '''
    Shows how a Ball with a boost works.

    - Drag to launch a boosted Ball.
''';

  @override
  void onLine(Vector2 line) {
    final ball = Ball(baseColor: Colors.transparent);
    final impulse = line * -1 * 20;
    ball.add(BallTurboChargingBehavior(impulse: impulse));

    add(ball);
  }
}
