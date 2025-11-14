import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chat_splash.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/recieved_chat_bubble.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/sending_chat_bubble.dart';

class UnsavedChatsListView extends StatelessWidget {
  const UnsavedChatsListView({
    super.key,
    required this.messages,
    required this.scrollController,
  });
  final List<MessageModel> messages;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return ChatSplash();
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return message.isUser
            ? SendingChatBubble(message: message.message)
            : RecievedChatBubble(botRepaly: message.message);
      },
    );
  }
}
