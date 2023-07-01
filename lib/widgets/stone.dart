import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../consts/color.dart';
import '../providers/game_provider.dart';

class Stone extends ConsumerWidget {
  const Stone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(darkThemeProvider);
    return Container(
      height: 7,
      width: 7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: isDarkTheme ? ThemeColor.lightTextMain : ThemeColor.darkTextMain),
    );
  }
}
