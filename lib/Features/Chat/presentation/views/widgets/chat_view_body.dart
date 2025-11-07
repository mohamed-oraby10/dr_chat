
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chat_view_app_bar.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chats_list_view.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/send_text_field.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        children: [
          ChatViewAppBar(),
          SizedBox(height: 20.h),
          ChatsListView(),
          SendTextField(),
        ],
      ),
    );
  }
}
