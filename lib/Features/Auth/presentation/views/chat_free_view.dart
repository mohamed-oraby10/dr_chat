
import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/chat_free_view_body.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';

class ChatFreeView extends StatelessWidget {
  const ChatFreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondColor,
      body: ChatFreeViewBody(),
    );
  }
}
