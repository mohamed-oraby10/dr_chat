part of 'login_with_facebook_cubit.dart';

@immutable
sealed class LoginWithFacebookState {}

final class LoginWithFacebookInitial extends LoginWithFacebookState {}

final class LoginWithFacebookLoading extends LoginWithFacebookState {}

final class LoginWithFacebookFailure extends LoginWithFacebookState {
  final String errMessage;

  LoginWithFacebookFailure({required this.errMessage});
  
}

final class LoginWithFacebookSuccess extends LoginWithFacebookState {}
