import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../consts/color.dart';
import '../providers/game_provider.dart';
import '../widgets/board.dart';
import '../widgets/player_info.dart';
import 'home.dart';

// Widget _dialog(BuildContext context, Widget child) {
//   return AlertDialog(
//     title: const Text(
//       "Congratulations!",
//       style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
//     ),
//     content: const Text("Player 1 win",
//         style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold)),
//     actionsAlignment: MainAxisAlignment.center,
//     actions: [
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text("Restart",
//                   style: TextStyle(
//                       color: Colors.black38, fontWeight: FontWeight.bold))),
//           TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text("Quit",
//                   style: TextStyle(
//                       color: Colors.black38, fontWeight: FontWeight.bold))),
//         ],
//       )
//     ],
//   );
// }

// Future<void> _dialogBuilder(BuildContext context, Widget dialog) {
//   return showGeneralDialog(
//       context: context,
//       pageBuilder: (BuildContext ctx, Animation a1, Animation a2) {
//         return Container();
//       },
//       transitionBuilder:
//           (BuildContext ctx, Animation a1, Animation a2, Widget child) {
//         double curve = Curves.easeInOut.transform(a1.value);
//         return Transform.scale(
//           scale: curve,
//           child: dialog,
//         );
//       },
//       transitionDuration: const Duration(milliseconds: 300));
// }
class Game extends ConsumerStatefulWidget {
  const Game({super.key});

  @override
  ConsumerState<Game> createState() => _GameState();
}

class _GameState extends ConsumerState<Game> {
  void _selectIndex(int index) {
    if (index == 0) {
      if (ref.watch(katroProvider.select((value) => value.isMoving))) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(darkThemeProvider);
    return Scaffold(
      backgroundColor:
          isDarkTheme ? ThemeColor.darkColorBg : ThemeColor.lightColorBg,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            isDarkTheme ? ThemeColor.darkColorBg : ThemeColor.lightColorBg,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Back"),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: "Restart")
        ],
        onTap: _selectIndex,
        unselectedItemColor:
            isDarkTheme ? ThemeColor.lightText : ThemeColor.darkText,
        selectedItemColor:
            isDarkTheme ? ThemeColor.lightText : ThemeColor.darkText,
      ),
      body: const Center(
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
      )),
    );
  }
}
