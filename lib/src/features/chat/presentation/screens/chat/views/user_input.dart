import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/features/chat/logic/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInputView extends HookConsumerWidget {
  final UserModel receiver;
  const UserInputView({
    super.key,
    required this.receiver,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final chatController = useTextEditingController();

    return Container(
      color: theme.background,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatController,
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(chatProvider.notifier).sendMessage(
                  receiver: receiver, message: chatController.text.trim());
              chatController.clear();
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: theme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
