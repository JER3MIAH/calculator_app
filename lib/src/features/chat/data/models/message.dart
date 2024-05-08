// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:converse/src/core/data/models/user_model.dart';

class ChatMessage {
  final UserModel sender;
  final UserModel receiver;
  final String message;
  final Timestamp timeStamp;

  ChatMessage({
    required this.sender,
    required this.receiver,
    required this.message,
    required this.timeStamp,
  });

  ChatMessage copyWith({
    UserModel? sender,
    UserModel? receiver,
    String? message,
    Timestamp? timeStamp,
  }) {
    return ChatMessage(
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      message: message ?? this.message,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender': sender.toMap(),
      'receiver': receiver.toMap(),
      'message': message,
      'timeStamp': timeStamp,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      sender: UserModel.fromMap(map['sender'] as Map<String, dynamic>),
      receiver: UserModel.fromMap(map['receiver'] as Map<String, dynamic>),
      message: map['message'] as String,
      timeStamp: map['timeStamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatMessage(sender: $sender, receiver: $receiver, message: $message, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;

    return other.sender == sender &&
        other.receiver == receiver &&
        other.message == message &&
        other.timeStamp == timeStamp;
  }

  @override
  int get hashCode {
    return sender.hashCode ^
        receiver.hashCode ^
        message.hashCode ^
        timeStamp.hashCode;
  }
}
