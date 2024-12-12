import 'package:chiclet/chiclet.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class AppButton extends HookWidget {
  final String title;
  final VoidCallback? onTap;
  final Color? color;
  final Color? hoverColor;
  final double? fontSize, width;
  final BorderRadius? borderRadius;
  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.hoverColor,
    this.borderRadius,
    this.fontSize,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final buttonColor = useState<Color>(color ?? theme.primary);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) =>
          buttonColor.value = (hoverColor ?? theme.primaryContainer),
      onExit: (_) => buttonColor.value = (color ?? theme.primary),
      child: ChicletAnimatedButton(
          width: width,
          height: 64,
          onPressed: onTap,
          buttonHeight: 5,
          backgroundColor: buttonColor.value,
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? 32,
              letterSpacing: 1.2,
              color: theme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          )),
    );
  }
}
