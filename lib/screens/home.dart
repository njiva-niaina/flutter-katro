import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:katro/widgets/neumorphic_button.dart';

import '../consts/color.dart';
import '../providers/game_provider.dart';
import 'game.dart';
import 'setting.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final katro = ref.watch(katroProvider);
    final isDarkTheme = ref.watch(darkThemeProvider);
    TextStyle style = TextStyle(
        color: isDarkTheme ? ThemeColor.lightText : ThemeColor.darkTextSecond);
    return Scaffold(
      backgroundColor:
          isDarkTheme ? ThemeColor.darkColorBg : ThemeColor.lightColorBg,
      body: Center(
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
                  color: isDarkTheme
                      ? ThemeColor.darkColorBg
                      : ThemeColor.lightColorBg),
            ),
            if (katro.isPlaying) ...[
              NeumorphicButton(
                  width: 128,
                  height: 50,
                  borderRadius: 16,
                  child: Text("Continue", style: style),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Game()))),
            ] else ...[
              NeumorphicButton(
                  width: 128,
                  height: 50,
                  borderRadius: 16,
                  child: Text("One Player", style: style),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Game()))),
              NeumorphicButton(
                  width: 128,
                  height: 50,
                  borderRadius: 16,
                  child: Text("Two Players", style: style),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Game()))),
            ],
            NeumorphicButton(
                width: 128,
                height: 50,
                borderRadius: 16,
                child: Text("Setting", style: style),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Setting()))),
            NeumorphicButton(
                width: 128,
                height: 50,
                borderRadius: 16,
                child: Text("Quit", style: style),
                onTap: () => print("One player")),
          ],
        ),
      ),
    );
  }
}
