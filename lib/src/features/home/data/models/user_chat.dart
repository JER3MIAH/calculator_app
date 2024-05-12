import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/features/chat/data/models/message.dart';

class UserChat {
  final String id;
  final UserModel person;
  final List<ChatMessage> messages;

  UserChat({
    required this.id,
    required this.messages,
    required this.person,
  });
}
