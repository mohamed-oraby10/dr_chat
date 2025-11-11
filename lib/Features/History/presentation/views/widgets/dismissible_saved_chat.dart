import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/saved_chat_item.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/widgets/custom_icon_button.dart';

class DismissibleSavedChat extends StatelessWidget {
  const DismissibleSavedChat({super.key, required this.chat});
  final ChatModel chat;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(25.r),
      child: Dismissible(
        key: Key('value'),
        background: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Container(
            padding: EdgeInsets.all(15.r),
            height: 110.h,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: const Color(0xffFF6666),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
            ),
            child: CustomIconButton(
              image: AssetsData.trashIcon,
              iconColor: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          showCustomSnakBar(context, content: 'Chat deleted successfully');
        },
        child: SavedChatItem(chat: chat),
      ),
    );
  }
}
