import 'package:converse/src/features/chat/logic/services/chat_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatServiceProvider = Provider<ChatService>((ref) => ChatService());
