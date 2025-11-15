import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo.dart';

part 'login_with_facebook_state.dart';

class LoginWithFacebookCubit extends Cubit<LoginWithFacebookState> {
  LoginWithFacebookCubit(this.authRepo) : super(LoginWithFacebookInitial());
   final AuthRepo authRepo;
  Future<void> loginWithFacebook() async {
    emit(LoginWithFacebookLoading());
    var result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) {
        emit(LoginWithFacebookFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(LoginWithFacebookSuccess());
      },
    );
  }
}
