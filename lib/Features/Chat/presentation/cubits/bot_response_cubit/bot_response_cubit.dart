import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo.dart';

part 'bot_response_state.dart';

class BotResponseCubit extends Cubit<BotResponseState> {
  BotResponseCubit(this.chatRepo) : super(BotResponseInitial());
  final ChatRepo chatRepo;
  Future<void> fetchBotResponse({
    required String userMessage,
    required String chatId,
  }) async {
    emit(BotResponseLoading());
    var result = await chatRepo.fetchBotResponse(userMessage: userMessage);
    result.fold(
      (failure) {
        emit(BotResponseFailure(errMessage: failure.errMessage));
      },
      (message) async {
        emit(BotResponseSuccess(messageModel: message));
        await chatRepo.saveChats(messages: [message], chatId: chatId);
      },
    );
  }

  Future<void> sendMessage(context, String value, String chatId) async {
    await chatRepo.saveChats(
      messages: [MessageModel(isUser: true, message: value)],
      chatId: chatId,
    );
    fetchBotResponse(userMessage: value, chatId: chatId);
  }
}
