import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/core/providers/database_service_provider.dart';
import 'package:converse/src/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = ChangeNotifierProvider((ref) => UserProvider(
      databaseService: ref.watch(databaseServiceProvider),
    ));

class UserProvider extends ChangeNotifier {
  final DatabaseService databaseService;
  UserProvider({
    required this.databaseService,
  });
  UserModel user = UserModel.empty();

  void retrieveUserInfo() async {
    user = await databaseService
        .retrieveUserInfo(FirebaseAuth.instance.currentUser!.email ?? 'null');

  }
}
