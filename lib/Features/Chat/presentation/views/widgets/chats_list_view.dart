import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/sending_chat_bubble.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return SendingChatBubble();
        },
      ),
    );
  }
}
