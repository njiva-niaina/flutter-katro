import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../consts/color.dart';
import '../providers/game_provider.dart';
import 'home.dart';

class Setting extends ConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(darkThemeProvider);
    return Scaffold(
      backgroundColor:
          isDarkTheme ? ThemeColor.darkColorBg : ThemeColor.lightColorBg,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDarkTheme ? ThemeColor.lightText : ThemeColor.darkText,
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Home()))),
        backgroundColor:
            isDarkTheme ? ThemeColor.darkColorBg : ThemeColor.lightColorBg,
        shadowColor: Colors.transparent,
        toolbarHeight: 40,
      ),
      body: Center(
        child: Column(children: [
          SwitchListTile(
            title: Text("Dark mode",
                style: TextStyle(
                  color:
                      isDarkTheme ? ThemeColor.lightText : ThemeColor.darkText,
                )),
            value: isDarkTheme,
            onChanged: (value) =>
                ref.read(darkThemeProvider.notifier).state = value,
            activeColor: Colors.black45,
            inactiveThumbColor: Colors.black12,
            activeTrackColor:
                isDarkTheme ? ThemeColor.lightColorBg : ThemeColor.darkColorBg,
          )
        ]),
      ),
    );
  }
}
