import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'consts/color.dart';
import 'providers/game_provider.dart';
import 'screens/home.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(darkThemeProvider);
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor:
              isDarkTheme ? ThemeColor.darkColorBg : ThemeColor.lightColorBg,
          body: const Home()
          // body: const Setting()
          ),
    );
  }
}
