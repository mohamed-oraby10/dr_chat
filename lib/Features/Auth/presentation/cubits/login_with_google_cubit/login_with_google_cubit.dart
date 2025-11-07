import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo.dart';

part 'login_with_google_state.dart';

class LoginWithGoogleCubit extends Cubit<LoginWithGoogleState> {
  LoginWithGoogleCubit(this.authRepo) : super(LoginWithGoogleInitial());
  final AuthRepo authRepo;
  Future<void> loginWithGoogle() async {
    emit(LoginWithGoogleLoading());
    var result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) {
        emit(LoginWithGoogleFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(LoginWithGoogleSuccess());
      },
    );
  }
}
