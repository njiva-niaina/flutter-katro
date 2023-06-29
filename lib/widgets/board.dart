import 'package:flutter/material.dart';

import 'hole.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 4; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [for (int j = 0; j < 4; j++) Hole(index: 12 - i * 4 + j)],
          ),
      ],
    );
  }
}
