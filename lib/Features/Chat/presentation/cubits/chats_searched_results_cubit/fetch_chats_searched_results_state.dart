part of 'fetch_chats_searched_results_cubit.dart';

@immutable
sealed class FetchChatsSearchedResultsState {}

final class FetchChatsSearchedResultsInitial
    extends FetchChatsSearchedResultsState {}

final class FetchChatsSearchedResultsLoading
    extends FetchChatsSearchedResultsState {}

final class FetchChatsSearchedResultsSuccess
    extends FetchChatsSearchedResultsState {
  final List<ChatModel> chats;

  FetchChatsSearchedResultsSuccess({required this.chats});
}

final class FetchChatsSearchedResultsFailure
    extends FetchChatsSearchedResultsState {
  final String errMessage;

  FetchChatsSearchedResultsFailure({required this.errMessage});
}
