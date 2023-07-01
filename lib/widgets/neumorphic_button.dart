import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:katro/providers/game_provider.dart';

import '../consts/color.dart';

class NeumorphicButton extends ConsumerStatefulWidget {
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
  ConsumerState<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends ConsumerState<NeumorphicButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(darkThemeProvider);
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
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isDarkTheme
                  ? ThemeColor.darkColorBg
                  : ThemeColor.lightColorBg,
              boxShadow: [
                BoxShadow(
                    blurRadius: blur,
                    offset: -distance,
                    color: isDarkTheme
                        ? ThemeColor.lightText
                        : ThemeColor.darkText,
                    inset: isPressed),
                BoxShadow(
                    blurRadius: blur,
                    offset: distance,
                    color: isDarkTheme
                        ? ThemeColor.darkText
                        : ThemeColor.lightText,
                    inset: isPressed)
              ]),
          child: widget.child),
    );
  }
}
