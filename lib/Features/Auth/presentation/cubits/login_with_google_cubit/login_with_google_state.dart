part of 'login_with_google_cubit.dart';

@immutable
abstract class LoginWithGoogleState {}

 class LoginWithGoogleInitial extends LoginWithGoogleState {}

class LoginWithGoogleLoading extends LoginWithGoogleState {}

class LoginWithGoogleSuccess extends LoginWithGoogleState {}

class LoginWithGoogleFailure extends LoginWithGoogleState {
  final String errMessage;

  LoginWithGoogleFailure({required this.errMessage});
}
