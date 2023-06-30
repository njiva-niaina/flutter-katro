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
    return Text(playerIndex == mainPlayer ? "YOUR TURN!" : "",
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.black38));
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
