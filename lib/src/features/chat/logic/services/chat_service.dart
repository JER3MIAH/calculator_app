import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/features/chat/data/models/message.dart';
import 'package:converse/src/features/home/logic/providers/user_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ChatService {
  final UserProvider userProvider;
  ChatService({
    required this.userProvider,
  });
  final _db = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;

  Stream<List<UserModel>> getUsersStream() {
    return _db.collection('users').snapshots().map((snap) {
      return snap.docs.map((doc) {
        final user = doc.data();
        return UserModel(
          id: user['id'],
          username: user['username'],
          email: user['email'],
        );
      }).toList();
    });
  }

  Stream<List<UserModel>> getChattedUsersStream() {
    //TODO: Fix to actually return users with existing chat
    return _db.collection('users').snapshots().map((snap) {
      return snap.docs.map((doc) {
        final user = doc.data();
        return UserModel(
          id: user['id'],
          username: user['username'],
          email: user['email'],
        );
      }).toList();
    });
  }

  Future<void> sendMessage(
    UserModel receiver,
    String message,
    String messageType,
  ) async {
    List<String> ids = [userProvider.user.id, receiver.id];
    ids.sort();
    String chatRoomID = ids.join('_');
    String? imageUrl;

    if (messageType == kImageType) {
      imageUrl = await _uploadImage(File(message));
    }
    ChatMessage newMessage = ChatMessage(
      sender: userProvider.user,
      receiver: receiver,
      message: messageType == kImageType ? imageUrl! : message,
      messageType: messageType,
      timeStamp: Timestamp.now(),
    );
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

  Future<String?> _uploadImage(File imageFile) async {
    try {
      final ref = _firebaseStorage
          .ref()
          .child('chat_images')
          .child(DateTime.now().toString());
      final uploadTask = ref.putFile(imageFile);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      log('Failed to upload image: $e');
      return null;
    }
  }

  Future<void> saveImageToGallery(String imageUrl) async {
    try {
      var response = await Dio()
          .get(imageUrl, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
      );
      log('saved image: $result');
    } catch (e) {
      throw 'Error saving image to gallery: $e';
    }
  }
}
