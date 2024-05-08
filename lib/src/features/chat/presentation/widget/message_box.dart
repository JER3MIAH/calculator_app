import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final bool isCurrentUser;
  final String message;
  const MessageBox({
    super.key,
    required this.isCurrentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          margin: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 10.h),
          decoration: BoxDecoration(
            color: isCurrentUser ? theme.primary : theme.background,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isCurrentUser ? theme.background : null,
            ),
          ),
        ),
      ],
    );
  }
}
