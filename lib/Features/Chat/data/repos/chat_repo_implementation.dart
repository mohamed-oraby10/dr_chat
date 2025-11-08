import 'package:dartz/dartz.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo.dart';
import 'package:new_dr_chat_application/core/errors/failure.dart';

class ChatRepoImplementation implements ChatRepo {
  @override
  Future<Either<Failure, MessageModel>> fetchBotResponse() {
    // TODO: implement fetchBotResponse
    throw UnimplementedError();
  }
}