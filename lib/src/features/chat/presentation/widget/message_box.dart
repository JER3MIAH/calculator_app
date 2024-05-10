import 'package:converse/src/features/theme/logic/theme_provider.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageBox extends ConsumerWidget {
  final bool isCurrentUser;
  final String message;
  const MessageBox({
    super.key,
    required this.isCurrentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final themeProv = ref.watch(themeProvider);

    return Row(
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .8,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            margin: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 5.h),
            decoration: BoxDecoration(
              color: isCurrentUser
                  ? theme.primaryContainer
                  : themeProv.isDarkMode
                      ? theme.primary
                      : theme.background,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              message,
              style: TextStyle(
                  color: !isCurrentUser && !themeProv.isDarkMode
                      ? null
                      : appColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
