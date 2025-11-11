part of 'remove_all_chats_cubit.dart';

@immutable
sealed class RemoveAllChatsState {}

final class RemoveAllChatsInitial extends RemoveAllChatsState {}
final class RemoveAllChatsLoading extends RemoveAllChatsState {}

final class RemoveAllChatsFailure extends RemoveAllChatsState {
  final String errMessage;

  RemoveAllChatsFailure({required this.errMessage});
}

final class RemoveAllChatsSuccess extends RemoveAllChatsState {
  
}
