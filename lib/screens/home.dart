import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:katro/widgets/neumorphic_button.dart';

import '../consts/color.dart';
import '../providers/game_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(darkThemeProvider);
    TextStyle style = TextStyle(
        color:
            isDarkTheme ? ThemeColor.lightTextMain : ThemeColor.darkTextMain);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'KATRO',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 56,
                shadows: [
                  Shadow(
                      offset: const Offset(3, 3),
                      color: isDarkTheme
                          ? ThemeColor.darkText
                          : ThemeColor.lightText,
                      blurRadius: 10),
                  Shadow(
                      offset: const Offset(-3, -3),
                      color: isDarkTheme
                          ? ThemeColor.lightText
                          : ThemeColor.darkText,
                      blurRadius: 10)
                ],
                color: const Color(0xffe7ecef)),
          ),
          NeumorphicButton(
              width: 128,
              height: 50,
              borderRadius: 16,
              child: Text("ONE PLAYER", style: style),
              onTap: () => print("One player")),
          NeumorphicButton(
              width: 128,
              height: 50,
              borderRadius: 16,
              child: Text("TWO PLAYERS", style: style),
              onTap: () => print("One player")),
          NeumorphicButton(
              width: 128,
              height: 50,
              borderRadius: 16,
              child: Text("SETTING", style: style),
              onTap: () => print("One player")),
          NeumorphicButton(
              width: 128,
              height: 50,
              borderRadius: 16,
              child: Text("QUIT", style: style),
              onTap: () => print("One player")),
        ],
      ),
    );
  }
}
