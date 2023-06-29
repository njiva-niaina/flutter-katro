import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/board.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xFFe7ecef),
          body: Center(child: Board()),
        ),
        debugShowCheckedModeBanner: false);
  }
}
