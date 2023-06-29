import 'package:flutter/material.dart';

class Stone extends StatelessWidget {
  const Stone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.blueAccent),
    );
  }
}
