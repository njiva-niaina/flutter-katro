import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/katro_provider.dart';
import 'stone.dart';

class StoneContainer extends ConsumerWidget {
  const StoneContainer({super.key, required this.playerIndex});
  final int playerIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final katro = ref.watch(katroProvider);
    int totalInHand = playerIndex == katro.mainPlayer ? katro.totalInHand : 0;
    return Container(
      margin: const EdgeInsets.all(4),
      height: 35,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFe7ecef),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2.0,
                offset: Offset(-2, -2),
                color: Colors.white,
                inset: true),
            BoxShadow(
                blurRadius: 2.0,
                offset: Offset(2, 2),
                color: Color(0xFFa7a9af),
                inset: true)
          ]),
      child: Column(
        children: [
          Flexible(
              child: GridView.count(
            crossAxisCount: 10,
            padding: const EdgeInsets.all(6),
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            children: [for (int i = 0; i < totalInHand; i++) const Stone()],
          ))
        ],
      ),
    );
  }
}
