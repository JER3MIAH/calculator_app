import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:converse/src/core/data/models/user_model.dart';

class ChatService {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<UserModel>> getUsersStream() {
    return _firestore.collection('users').snapshots().map((snap) {
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
}
