import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.loginUser(email: email, password: password);
    result.fold(
      (failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(AuthSuccess());
      },
    );
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String confirmedPassword,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.registerUser(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
    );
    result.fold(
      (failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(AuthSuccess());
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    var result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(AuthSuccess());
      },
    );
  }

  Future<void> resetPassword({required String email}) async {
    emit(AuthLoading());
    var result = await authRepo.resetPassword(email: email);
    result.fold(
      (failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(AuthSuccess());
      },
    );
  }
}
