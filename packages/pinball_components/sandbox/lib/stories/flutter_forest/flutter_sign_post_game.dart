import 'dart:async';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:sandbox/common/common.dart';
import 'package:sandbox/stories/ball/basic_ball_game.dart';

class FlutterSignPostGame extends BasicBallGame with Traceable {
  static const info = '''
    Shows how a FlutterSignPost is rendered.

    - Activate the "trace" parameter to overlay the body.
''';

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.followVector2(Vector2.zero());
    await add(FlutterSignPost()..priority = 1);
    await traceAllBodies();
  }
}
