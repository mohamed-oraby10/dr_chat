import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/dismissible_saved_chat.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.chats});
  final List<ChatModel> chats;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return DismissibleSavedChat(chat: chat);
        },
      ),
    );
  }
}
