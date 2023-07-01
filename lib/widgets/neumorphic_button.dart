import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeumorphicButton extends StatefulWidget {
  const NeumorphicButton(
      {super.key,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.child,
      required this.onTap});

  final double width;
  final double height;
  final double borderRadius;
  final Widget child;
  final Function onTap;

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    Offset distance = isPressed ? const Offset(2, 2) : const Offset(3, 3);
    double blur = isPressed ? 2.0 : 3.0;
    return Listener(
      onPointerUp: (_) => setState(() => isPressed = false),
      onPointerDown: (_) => setState(() {
        isPressed = true;
        widget.onTap();
      }),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: const EdgeInsets.all(4),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFFe7ecef),
              boxShadow: [
                BoxShadow(
                    blurRadius: blur,
                    offset: -distance,
                    color: Colors.white,
                    inset: isPressed),
                BoxShadow(
                    blurRadius: blur,
                    offset: distance,
                    color: const Color(0xFFa7a9af),
                    inset: isPressed)
              ]),
          child: widget.child),
    );
  }
}
