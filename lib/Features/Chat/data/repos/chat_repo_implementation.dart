import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
      var request = await apiService.sendRequest(message: userMessage);
      var eventId = request['event_id'];
      var response = await apiService.getResponseByEventId(eventId: eventId);
      var botReplay = response['data'][0];
      return Right(MessageModel(message: botReplay));
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
