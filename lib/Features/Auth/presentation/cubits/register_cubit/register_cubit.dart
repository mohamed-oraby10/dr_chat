import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;
  Future<void> registerUser({
    required String email,
    required String password,
    required String confirmedPassword,
  }) async {
    emit(RegisterLoading());
    var result = await authRepo.registerUser(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
    );
    result.fold(
      (failure) {
        emit(RegisterFailure(errMessage: failure.errMessage));
      },
      (_) {
        emit(RegisterSuccess());
      },
    );
  }
}
