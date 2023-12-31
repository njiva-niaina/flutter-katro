import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../consts/color.dart';
import '../providers/game_provider.dart';

class PlayerScore extends ConsumerWidget {
  const PlayerScore({super.key, required this.playerIndex});
  final int playerIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final katro = ref.watch(katroProvider);
    final isDarkTheme = ref.watch(darkThemeProvider);
    String playerName = playerIndex == 1 ? 'Player 1' : "Player 2";
    int adder = playerIndex == katro.mainPlayer ? katro.totalInHand : 0;
    int score = playerIndex == 1
        ? katro.board.getRange(0, 8).reduce((value, element) => value + element)
        : katro.board
            .getRange(8, 16)
            .reduce((value, element) => value + element);
    Color mainColor =
        isDarkTheme ? ThemeColor.lightTextMain : ThemeColor.darkTextMain;
    Color secondColor =
        isDarkTheme ? ThemeColor.lightText : ThemeColor.darkText;
    Color playerColor =
        playerIndex == katro.mainPlayer ? mainColor : secondColor;
    TextStyle textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: playerColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(playerName.toUpperCase(), style: textStyle),
        Text("${score + adder}", style: textStyle)
      ],
    );
  }
}
