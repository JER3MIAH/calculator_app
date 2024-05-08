import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/features/chat/presentation/screens/chat/views/message_list.dart';
import 'package:converse/src/features/chat/presentation/screens/chat/views/user_input.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// class ChatScreenArgs {
//   final UserModel recipient;
//   final UserModel currentUser;
//   const ChatScreenArgs({
//     required this.recipient,
//     required this.currentUser,
//   });
// }

class ChatScreen extends HookConsumerWidget {
  final UserModel recipient;
  const ChatScreen({super.key, required this.recipient});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipient.username),
      ),
      body: Container(
        color: appColors.grey80.withOpacity(.4),
        child: Column(
          children: [
            Expanded(
              child: MessageListView(receiver: recipient),
            ),
            UserInputView(
              receiver: recipient,
            ),
          ],
        ),
      ),
    );
  }
}
