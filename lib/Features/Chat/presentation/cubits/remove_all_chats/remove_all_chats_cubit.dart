import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo.dart';

part 'remove_all_chats_state.dart';

class RemoveAllChatsCubit extends Cubit<RemoveAllChatsState> {
  RemoveAllChatsCubit(this.chatRepo) : super(RemoveAllChatsInitial());
  final ChatRepo chatRepo;
  Future<void> removeAllChats() async {
    emit(RemoveAllChatsLoading());
    var result = await chatRepo.removeAllChats();
    result.fold(
      (failure) {
        emit(RemoveAllChatsFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(RemoveAllChatsSuccess());
      },
    );
  }
}
