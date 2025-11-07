import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_dr_chat_application/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> registerUser({
    required String? email,
    required String? password,
    required String? confirmedPassword,
  });
  Future<Either<Failure, void>> loginUser({
    required String? email,
    required String? password,
  });
   Future<Either<Failure, UserCredential>> loginWithGoogle();
      Future<Either<Failure, void>> resetPassword({required String email});

}
