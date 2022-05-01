import 'package:flutter/material.dart';
import 'package:pinball/game/pinball_game.dart';
import 'package:pinball/l10n/l10n.dart';
import 'package:pinball/select_character/select_character.dart';

/// {@template play_button_overlay}
/// [Widget] that renders the button responsible to starting the game
/// {@endtemplate}
class PlayButtonOverlay extends StatelessWidget {
  /// {@macro play_button_overlay}
  const PlayButtonOverlay({
    Key? key,
    required PinballGame game,
  })  : _game = game,
        super(key: key);

  final PinballGame _game;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: ElevatedButton(
        onPressed: () async {
          _game.gameFlowController.start();
          await showCharacterSelectionDialog(context);
        },
        child: Text(l10n.play),
      ),
    );
  }
}
