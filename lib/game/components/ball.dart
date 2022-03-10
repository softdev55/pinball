import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:pinball/game/game.dart';

/// {@template ball}
/// A solid, [BodyType.dynamic] sphere that rolls and bounces along the
/// [PinballGame].
/// {@endtemplate}
class Ball extends PositionBodyComponent<PinballGame, SpriteComponent> {
  /// {@macro ball}
  Ball({
    required Vector2 position,
  })  : _position = position,
        super(size: Vector2.all(2));

  /// The initial position of the [Ball] body.
  final Vector2 _position;

  /// Asset location of the sprite that renders with the [Ball].
  ///
  /// Sprite is preloaded by [PinballGameAssetsX].
  static const spritePath = 'components/ball.png';

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = await gameRef.loadSprite(spritePath);
    final tint = gameRef.theme.characterTheme.ballColor.withOpacity(0.5);
    positionComponent = SpriteComponent(sprite: sprite, size: size)..tint(tint);
  }

  @override
  Body createBody() {
    final shape = CircleShape()..radius = size.x / 2;

    final fixtureDef = FixtureDef(shape)..density = 1;

    final bodyDef = BodyDef()
      ..userData = this
      ..position = _position
      ..type = BodyType.dynamic;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  /// Removes the [Ball] from a [PinballGame]; spawning a new [Ball] if
  /// any are left.
  ///
  /// Triggered by [BottomWallBallContactCallback] when the [Ball] falls into
  /// a [BottomWall].
  void lost() {
    shouldRemove = true;

    final bloc = gameRef.read<GameBloc>()..add(const BallLost());

    final shouldBallRespwan = !bloc.state.isLastBall;
    if (shouldBallRespwan) {
      gameRef.spawnBall();
    }
  }
}
