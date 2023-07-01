import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'player_score.dart';
import 'stone_container.dart';

class PlayerInfo extends StatelessWidget {
  const PlayerInfo({
    super.key,
    required this.playerIndex,
  });

  final int playerIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlayerScore(playerIndex: playerIndex),
            StoneContainer(playerIndex: playerIndex)
          ],
        ),
      ],
    );
  }
}
