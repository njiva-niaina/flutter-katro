import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/katro_provider.dart';
import 'stones.dart';

class Hole extends ConsumerWidget {
  const Hole({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final katro = ref.watch(katroProvider);
    Color borderColor =
        katro.currentIndex == index ? Colors.brown : Colors.transparent;
    return GestureDetector(
      onTap: () async => await ref.read(katroProvider.notifier).play(index),
      child: Container(
        margin: const EdgeInsets.all(4),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xFFe7ecef),
            border: Border.all(width: 2, color: borderColor),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 4.0,
                  offset: Offset(-4, -4),
                  color: Colors.white,
                  inset: true),
              BoxShadow(
                  blurRadius: 4.0,
                  offset: Offset(4, 4),
                  color: Color(0xFFa7a9af),
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
