import 'package:dartz/dartz.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/core/errors/failure.dart';

abstract class ChatRepo {
  Future<Either<Failure, MessageModel>> fetchBotResponse({
    required String userMessage,
  });
  Future<void> saveChats({
    required List<MessageModel> messages,
    required String chatId,
  });
  Future<Either<Failure, void>> removeAllChats();
  Future<Either<Failure, List<ChatModel>>> fetchChatsSearchedResults({required String query});
}
