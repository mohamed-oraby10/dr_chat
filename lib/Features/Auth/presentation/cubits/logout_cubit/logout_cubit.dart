import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.authRepo) : super(LogoutInitial());
  final AuthRepo authRepo;
  Future<void> logoutUser() async {
    emit(LogoutLoading());
    var result = await authRepo.logoutUser();
    result.fold(
      (failure) {
        emit(Logoutfailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(LogoutSuccess());
      },
    );
  }
}
