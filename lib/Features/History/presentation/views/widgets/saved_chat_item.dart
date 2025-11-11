import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class SavedChatItem extends StatelessWidget {
  const SavedChatItem({super.key, required this.chat});
  final ChatModel chat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Container(
        width: double.infinity,
        height: 110.h,
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(color: AppColors.thirdColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chat.firstMessage,
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
                    child: Text(
                      DateFormat(
                        'd MMMM yyyy | hh:mm a',
                      ).format(chat.timestamp.toDate()),
                      style: Styles.textStyle14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
