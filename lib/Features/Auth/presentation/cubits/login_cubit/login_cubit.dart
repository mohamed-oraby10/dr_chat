import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
   final AuthRepo authRepo;
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await authRepo.loginUser(email: email, password: password);
    result.fold(
      (failure) {
        emit(LoginFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(LoginSuccess());
      },
    );
  }

}
