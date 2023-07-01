import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../consts/color.dart';
import '../providers/game_provider.dart';
import 'stones.dart';

class Hole extends ConsumerWidget {
  const Hole({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final katro = ref.watch(katroProvider);
    final isDarkTheme = ref.watch(darkThemeProvider);
    Color color =
        isDarkTheme ? ThemeColor.lightTextMain : ThemeColor.darkTextMain;
    Color borderColor =
        katro.currentIndex == index ? color : Colors.transparent;
    ref.listen(katroProvider, (previous, next) async {
      var range = next.mainPlayer == 1 ? [8, 16] : [0, 8];
      var score = next.board
          .getRange(range[0], range[1])
          .reduce((value, element) => value + element);
      if (score <= 1) {
        print(score);
      }
    });
    return GestureDetector(
      onTap: () async {
        await ref.read(katroProvider.notifier).play(index);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                isDarkTheme ? ThemeColor.darkColorBg : ThemeColor.lightColorBg,
            border: Border.all(width: 2, color: borderColor),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4.0,
                  offset: const Offset(-4, -4),
                  color:
                      isDarkTheme ? ThemeColor.darkText : ThemeColor.lightText,
                  inset: true),
              BoxShadow(
                  blurRadius: 4.0,
                  offset: const Offset(4, 4),
                  color:
                      isDarkTheme ? ThemeColor.lightText : ThemeColor.darkText,
                  inset: true)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Stones(count: katro.board[index])],
        ),
      ),
    );
  }
}
