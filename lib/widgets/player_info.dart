import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/katro_provider.dart';
import 'player_score.dart';
import 'stone_container.dart';

class PlayerInfo extends ConsumerWidget {
  const PlayerInfo({
    super.key,
    required this.playerIndex,
  });

  final int playerIndex;

  Widget turnInfo(int mainPlayer) {
    Color playerColor = playerIndex == 1 ? Colors.red : Colors.teal;
    return Text(playerIndex == mainPlayer ? "YOUR TURN!" : "",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            shadows: [
              const Shadow(
                  offset: Offset(3, 3), color: Colors.black38, blurRadius: 10),
              Shadow(
                  offset: const Offset(-3, -3),
                  color: Colors.white.withOpacity(0.85),
                  blurRadius: 10)
            ],
            letterSpacing: 1,
            color: playerColor));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainPlayer =
        ref.watch(katroProvider.select((katro) => katro.mainPlayer));
    return Column(
      children: [
        turnInfo(mainPlayer),
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
