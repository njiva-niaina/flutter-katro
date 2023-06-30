import 'package:flutter/material.dart';

import '../widgets/board.dart';
import '../widgets/player_info.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RotatedBox(
          quarterTurns: 2,
          child: PlayerInfo(playerIndex: -1),
        ),
        Board(),
        PlayerInfo(playerIndex: 1),
      ],
    ));
  }
}
