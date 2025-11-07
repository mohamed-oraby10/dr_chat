import 'package:new_dr_chat_application/core/errors/failure.dart';

class AuthFailure extends Failure {
  AuthFailure({required super.errMessage});
  factory AuthFailure.confirmationPassword() =>
      AuthFailure(errMessage: 'Confirmed password does not match');

  factory AuthFailure.weakPassword() =>
      AuthFailure(errMessage: 'The password provided is too weak.');

  factory AuthFailure.invalidEmail() =>
      AuthFailure(errMessage: 'The email address is badly formatted.');

  factory AuthFailure.usedEmail() =>
      AuthFailure(errMessage: 'The account already exists for that email.');

  factory AuthFailure.invalidCredential() => AuthFailure(
    errMessage:
        'Wrong password provided for that user or No user found for that email.',
  );
  factory AuthFailure.unKnown() =>
      AuthFailure(errMessage: 'There is an server error');
}
