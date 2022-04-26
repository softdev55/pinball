import 'dart:async';

import 'package:flame/input.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_flame/pinball_flame.dart';
import 'package:sandbox/stories/ball/basic_ball_game.dart';

class DinoWallGame extends BallGame {
  DinoWallGame() : super();

  static const description = '''
    Shows how DinoWalls are rendered.

    - Activate the "trace" parameter to overlay the body.
    - Tap anywhere on the screen to spawn a ball into the game.
''';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await images.loadAll([
      Assets.images.dino.dinoLandTop.keyName,
      Assets.images.dino.dinoLandBottom.keyName,
    ]);

    await addFromBlueprint(DinoWalls());
    camera.followVector2(Vector2.zero());
    await traceAllBodies();
  }
}
