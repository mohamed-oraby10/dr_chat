import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());
  final AuthRepo authRepo;
  
  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetPassword(email: email);
    result.fold(
      (failure) {
        emit(ResetPasswordFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
