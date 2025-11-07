import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_dr_chat_application/Features/Auth/data/errors/auth_failure.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo.dart';
import 'package:new_dr_chat_application/core/errors/failure.dart';

class AuthRepoImplementation implements AuthRepo {
  @override
  Future<Either<Failure, void>> loginUser({
    required String? email,
    required String? password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          {
            return Left(AuthFailure.invalidEmail());
          }
        case 'invalid-credential':
          {
            return Left(AuthFailure.invalidCredential());
          }
        default:
          {
            return Left(AuthFailure.unKnown());
          }
      }
    }
  }

  @override
  Future<Either<Failure, void>> registerUser({
    required String? email,
    required String? password,
    required String? confirmedPassword,
  }) async {
    try {
      if (password != confirmedPassword) {
        return left(AuthFailure.confirmationPassword());
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          {
            return Left(AuthFailure.weakPassword());
          }
        case 'invalid-credential':
          {
            return Left(AuthFailure.invalidCredential());
          }
        case 'invalid-email':
          {
            return Left(AuthFailure.invalidEmail());
          }
        case 'email-already-in-use':
          {
            return Left(AuthFailure.usedEmail());
          }
        default:
          return Left(AuthFailure.usedEmail());
      }
    }
  }

  @override
  Future<Either<Failure, UserCredential>> loginWithGoogle() async {
    try {
      //   final GoogleSignIn googleSignIn = GoogleSignIn();
      //  await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      return Right(
        await FirebaseAuth.instance.signInWithCredential(credential),
      );
    } catch (e) {
      return Left(AuthFailure.unKnown());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right(null);
    } catch (e) {
      return Left(AuthFailure.unKnown());
    }
  }
}
