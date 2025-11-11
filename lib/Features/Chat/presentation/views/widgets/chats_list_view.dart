import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chat_splash.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/recieved_chat_bubble.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/sending_chat_bubble.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key, required this.chatId});
  final String chatId;

  @override
  Widget build(BuildContext context) {
    final chatDoc = FirebaseFirestore.instance.collection(kChats).doc(chatId);

    return StreamBuilder<DocumentSnapshot>(
      stream: chatDoc.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            !snapshot.data!.exists ||
            snapshot.data!.data() == null) {
          return Center(child: ChatSplash());
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        final chat = ChatModel.fromJson(data);
        final messages = chat.messages;

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return message.isUser
                ? SendingChatBubble(message: message.message)
                : RecievedChatBubble(botRepaly: message.message);
          },
        );
      },
    );
  }
}
