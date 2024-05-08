import 'package:converse/src/core/data/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final UserModel userModel;
  const ChatScreen({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.username),
      ),
    );
  }
}
