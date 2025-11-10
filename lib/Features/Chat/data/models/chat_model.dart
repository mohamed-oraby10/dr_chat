import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';

class ChatModel {
  final List<MessageModel> messages;
  final String userId;
  final Timestamp timestamp;
  final String firstMessage;
  final String chatId;

  ChatModel({
    required this.messages,
    required this.userId,
    required this.timestamp,
    required this.firstMessage,
    required this.chatId,
  });

  factory ChatModel.fromJson(Map<String, dynamic> jsonData) {
    return ChatModel(
      messages: (jsonData['messages'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e))
          .toList(),
      userId: jsonData['userId'],
      timestamp: jsonData['timestamp'],
      firstMessage: jsonData['firstMessage'],
      chatId: jsonData['chatId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'chatId': chatId,
      'firstMessage': firstMessage,
      'timestamp': timestamp,
      'messages': messages.map((e) => e.toJson()).toList(),
    };
  }
}
