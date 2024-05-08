import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:converse/src/core/data/models/user_model.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;

  //? This function adds user info to the database if it doesnt already exist
  void saveUserInfo(String id, String username, String email) async {
    try {
      _db.collection('users').doc(id).set(
            UserModel(
              id: id,
              username: username,
              email: email,
            ).toMap(),
          );
    } catch (e) {
      log('Failed to save user info: $e');
    }
  }
}
