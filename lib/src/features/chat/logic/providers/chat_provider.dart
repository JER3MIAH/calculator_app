import 'dart:developer';
import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/features/chat/data/models/message.dart';
import 'package:converse/src/features/chat/logic/providers/chat_service_provider.dart';
import 'package:converse/src/features/chat/logic/services/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = ChangeNotifierProvider<ChatProvider>((ref) {
  return ChatProvider(chatService: ref.watch(chatServiceProvider));
});

class ChatProvider extends ChangeNotifier {
  final ChatService chatService;
  ChatProvider({
    required this.chatService,
  });

  void sendMessage(
      {required UserModel receiver, required String message}) async {
    try {
      if (message.isNotEmpty) {
        await chatService.sendMessage(receiver, message);
      }
    } catch (e) {
      log('Failed to send message:  stack:$e');
    }
  }

  Stream<List<ChatMessage>> getMessages(
      {required UserModel receiver, required UserModel sender}) {
    return chatService.getMessages(receiver);
  }
}
