import 'package:dartz/dartz.dart';
import 'package:new_dr_chat_application/Features/Chat/data/errors/server_failure.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo.dart';
import 'package:new_dr_chat_application/core/api_service.dart';
import 'package:new_dr_chat_application/core/errors/failure.dart';

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
}
