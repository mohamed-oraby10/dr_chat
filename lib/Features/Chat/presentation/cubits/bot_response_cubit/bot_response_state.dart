part of 'bot_response_cubit.dart';

@immutable
sealed class BotResponseState {}

final class BotResponseInitial extends BotResponseState {}
final class BotResponseLoading extends BotResponseState {}

final class BotResponseFailure extends BotResponseState {
  final String errMessage;

  BotResponseFailure({required this.errMessage});
}

final class BotResponseSuccess extends BotResponseState {
  final MessageModel messageModel;

  BotResponseSuccess({required this.messageModel});
}
