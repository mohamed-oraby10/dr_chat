import 'package:dr_chat/Features/Auth/presentation/views/widgets/chat_free_view_body.dart';
import 'package:flutter/material.dart';

class ChatFreeView extends StatelessWidget {
  const ChatFreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatFreeViewBody() ,
    );
  }
}