import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_dr_chat_application/Features/Chat/data/errors/server_failure.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo.dart';
import 'package:new_dr_chat_application/core/api_service.dart';
import 'package:new_dr_chat_application/core/errors/failure.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';

class ChatRepoImplementation implements ChatRepo {
  final ApiService apiService;
  ChatRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, MessageModel>> fetchBotResponse({
    required String userMessage,
  }) async {
    try {
      final botReply = await apiService.getBotReply(message: userMessage);
      return Right(MessageModel(message: botReply, isUser: false));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<void> saveChats({
    required List<MessageModel> messages,
    required String chatId,
  }) async {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final chatRef = FirebaseFirestore.instance.collection(kChats).doc(chatId);

    final snapshot = await chatRef.get();

    List<MessageModel> updatedMessages = [];

    if (snapshot.exists && snapshot.data() != null) {
      final existingChat = ChatModel.fromJson(snapshot.data()!);
      updatedMessages = List.from(existingChat.messages);
    }

    updatedMessages.addAll(messages);

    final chatModel = ChatModel(
      messages: updatedMessages,
      userId: currentUserId,
      timestamp: Timestamp.now(),
      firstMessage: updatedMessages.first.message,
      chatId: chatId,
    );

    await chatRef.set(chatModel.toJson(), SetOptions(merge: true));
  }

  @override
  Future<Either<Failure, void>> removeAllChats() async {
    final collection = FirebaseFirestore.instance.collection(kChats);
    final snapshots = await collection.get();
    final batch = FirebaseFirestore.instance.batch();
    try {
      for (var doc in snapshots.docs) {
        batch.delete(doc.reference);
      }
      return Right(await batch.commit());
    } catch (e) {
      return Left(ServerFailure(errMessage: 'There is an error'));
    }
  }
}
