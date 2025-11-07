import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/saved_chats_list_view.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [SavedChatsListView()],
      ),
    );
  }
}
