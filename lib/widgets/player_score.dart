import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/katro_provider.dart';

class PlayerScore extends ConsumerWidget {
  const PlayerScore({super.key, required this.playerIndex});
  final int playerIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final katro = ref.watch(katroProvider);
    String playerName = playerIndex == 1 ? 'Player 1' : "Player 2";
    int score = playerIndex == 1
        ? katro.board.getRange(0, 8).reduce((value, element) => value + element)
        : katro.board
            .getRange(8, 16)
            .reduce((value, element) => value + element);
    Color playerColor =
        playerIndex == katro.mainPlayer ? Colors.brown : Colors.black38;
    TextStyle textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: playerColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(playerName.toUpperCase(), style: textStyle),
        Text("$score", style: textStyle)
      ],
    );
  }
}
