import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/history_view_app_bar.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/saved_chats_list_view.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HistoryViewAppBar(),
          Expanded(child: SavedChatsListView()),
        ],
      ),
    );
  }
}
