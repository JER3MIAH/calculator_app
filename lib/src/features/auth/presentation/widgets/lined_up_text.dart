import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';

class LinedUpText extends StatelessWidget {
  final String leadingText, trailingText;
  final VoidCallback onTapTrailing;
  final bool isUndelined;
  const LinedUpText({
    super.key,
    required this.leadingText,
    required this.trailingText,
    required this.onTapTrailing,
    this.isUndelined = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leadingText,
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
        GestureDetector(
          onTap: onTapTrailing,
          child: Text(
            trailingText,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 14.sp,
              decoration: isUndelined ? TextDecoration.underline : null,
              decorationColor: theme.colorScheme.primary,
              decorationThickness: 2,
            ),
          ),
        ),
      ],
    );
  }
}
