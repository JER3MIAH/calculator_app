import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/features/chat/data/models/message.dart';
import 'package:converse/src/features/home/logic/providers/user_provider.dart';

class ChatService {
  final UserProvider userProvider;
  ChatService({
    required this.userProvider,
  });
  final _db = FirebaseFirestore.instance;

  Stream<List<UserModel>> getUsersStream() {
    return _db.collection('users').snapshots().map((snap) {
      return snap.docs.map((doc) {
        final user = doc.data();
        return UserModel(
          id: doc.id,
          username: user['username'],
          email: user['email'],
        );
      }).toList();
    });
  }

  Future<void> sendMessage(UserModel receiver, String message) async {
    ChatMessage newMessage = ChatMessage(
      sender: userProvider.user,
      receiver: receiver,
      message: message,
      timeStamp: Timestamp.now(),
    );
    List<String> ids = [userProvider.user.id, receiver.id];
    ids.sort();
    String chatRoomID = ids.join('_');

    //? Add new message to database
    await _db
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(
          newMessage.toMap(),
        );
  }

  Stream<List<ChatMessage>> getMessages(UserModel receiver) {
    List<String> ids = [userProvider.user.id, receiver.id];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _db
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatMessage.fromMap(doc.data());
      }).toList();
    });
  }
}
