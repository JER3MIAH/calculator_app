import 'package:calculator_app/src/shared/shared.dart';
import 'package:chiclet/chiclet.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class AppButton extends HookWidget {
  final String title;
  final VoidCallback? onTap;
  final Color? color, hoverColor, shadowColor, textColor;
  final double? fontSize, width;
  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.hoverColor,
    this.shadowColor,
    this.fontSize,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isHovered = useState<bool>(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ChicletAnimatedButton(
          width: width,
          height: 64,
          onPressed: onTap,
          buttonHeight: 5,
          backgroundColor: isHovered.value
              ? (hoverColor ?? theme.primaryContainer)
              : (color ?? theme.primary),
          buttonColor: shadowColor,
          child: AppText(
            title,
            fontSize: fontSize ?? (KDeviceType(context).isMobile ? 32 : 40),
            letterSpacing: 1.2,
            color: textColor ?? theme.onPrimary,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}
