import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/cubits/bot_response_cubit/bot_response_cubit.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chat_view_body.dart';
import 'package:new_dr_chat_application/core/di/service_locator.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.chatId});
  final String chatId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BotResponseCubit(
        getIt.get<ChatRepoImplementation>(),
      ),
      child: Scaffold(
        body: SafeArea(child: ChatViewBody(chatId: chatId)),
      ),
    );
  }
}
