import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo.dart';

part 'fetch_chats_searched_results_state.dart';

class FetchChatsSearchedResultsCubit
    extends Cubit<FetchChatsSearchedResultsState> {
  FetchChatsSearchedResultsCubit(this.chatRepo)
    : super(FetchChatsSearchedResultsInitial());
  final ChatRepo chatRepo;

  Future<void> fetchChatsSearchedResults({
    required String chatId,
    required String query,
  }) async {
    emit(FetchChatsSearchedResultsLoading());
    var result = await chatRepo.fetchChatsSearchedResults(
      query: query,
      chatId: chatId,
    );
    result.fold(
      (failure) {
        emit(FetchChatsSearchedResultsFailure(errMessage: failure.errMessage));
      },
      (chats) {
        emit(FetchChatsSearchedResultsSuccess(chats: chats));
      },
    );
  }
}
