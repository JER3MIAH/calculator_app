// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:converse/src/core/data/models/user_model.dart';

class ChatMessage {
  final UserModel sender;
  final UserModel receiver;
  final String message;
  final String messageType;
  final Timestamp timeStamp;

  ChatMessage({
    required this.sender,
    required this.receiver,
    required this.message,
    required this.messageType,
    required this.timeStamp,
  });

  ChatMessage copyWith({
    UserModel? sender,
    UserModel? receiver,
    String? message,
    String? messageType,
    Timestamp? timeStamp,
  }) {
    return ChatMessage(
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      message: message ?? this.message,
      messageType: messageType ?? this.messageType,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender': sender.toMap(),
      'receiver': receiver.toMap(),
      'message': message,
      'messageType': messageType,
      'timeStamp': timeStamp,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      sender: UserModel.fromMap(map['sender'] as Map<String, dynamic>),
      receiver: UserModel.fromMap(map['receiver'] as Map<String, dynamic>),
      message: map['message'] as String,
      messageType: map['messageType'] as String,
      timeStamp: map['timeStamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatMessage(sender: $sender, receiver: $receiver, message: $message, messageType: $messageType, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;

    return other.sender == sender &&
        other.receiver == receiver &&
        other.message == message &&
        other.messageType == messageType &&
        other.timeStamp == timeStamp;
  }

  @override
  int get hashCode {
    return sender.hashCode ^
        receiver.hashCode ^
        message.hashCode ^
        messageType.hashCode ^
        timeStamp.hashCode;
  }
}
