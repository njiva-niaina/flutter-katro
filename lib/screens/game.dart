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

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Congratulations!",
        style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
      ),
      content: const Text("Player 1 win",
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold)),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Restart",
                    style: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.bold))),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Quit",
                    style: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.bold))),
          ],
        )
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context, Widget dialog) {
    return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext ctx, Animation a1, Animation a2) {
          return Container();
        },
        transitionBuilder:
            (BuildContext ctx, Animation a1, Animation a2, Widget child) {
          double curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
            scale: curve,
            child: dialog,
          );
        },
        transitionDuration: const Duration(milliseconds: 300));
  }
}
