import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/cubits/chats_searched_results_cubit/fetch_chats_searched_results_cubit.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/cubits/remove_all_chats/remove_all_chats_cubit.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/history_view_body.dart';
import 'package:new_dr_chat_application/core/di/service_locator.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchChatsSearchedResultsCubit(
            getIt.get<ChatRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              RemoveAllChatsCubit(getIt.get<ChatRepoImplementation>()),
        ),
      ],
      child: Scaffold(body: SafeArea(child: HistoryViewBody())),
    );
  }
}
