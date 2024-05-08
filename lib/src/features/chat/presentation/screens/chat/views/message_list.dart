import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/features/chat/logic/providers/chat_provider.dart';
import 'package:converse/src/features/home/logic/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageListView extends ConsumerWidget {
  final UserModel sender;
  final UserModel receiver;
  const MessageListView({
    super.key,
    required this.sender,
    required this.receiver,
  });

  @override
  Widget build(BuildContext context, ref) {
    final userProv = ref.watch(userProvider);

    return StreamBuilder(
      stream: ref.read(chatProvider.notifier).getMessages(
            receiver: receiver,
            sender: sender,
          ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        final chats = snapshot.data ?? [];

        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];
            bool isCurrentUser = chat.sender.id == userProv.user.id;

            return Container(
              alignment:
                  isCurrentUser ? Alignment.centerRight : Alignment.centerRight,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(chat.message),
            );
          },
        );
      },
    );
  }
}
