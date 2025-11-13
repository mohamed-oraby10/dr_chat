part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutSuccess extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class Logoutfailure extends LogoutState {
  final String errMessage;

  Logoutfailure({required this.errMessage});
}
