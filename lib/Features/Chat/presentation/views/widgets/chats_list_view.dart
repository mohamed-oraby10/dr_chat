import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/recieved_chat_bubble.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/sending_chat_bubble.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key, required this.messages});
  final List<MessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:const BouncingScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
      return  message.isUser
            ? SendingChatBubble(message: message.message)
            : RecievedChatBubble(botRepaly: message.message);
      },
    );
  }
}
