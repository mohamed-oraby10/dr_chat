import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/recieved_chat_bubble.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/sending_chat_bubble.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

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
          return Center(
            child: Text(
              'Hello there, I\'m Dr Chat - Small talks can lead to big healing. I\'m here to listen.',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
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
