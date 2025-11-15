import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class SavedChatItem extends StatelessWidget {
  const SavedChatItem({super.key, required this.chat});
  final ChatModel chat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).go(AppRouter.kChatView, extra: chat.chatId);
        },
        child: Container(
          width: double.infinity,
          height: 110.h,
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(color: AppColors.third(context)),
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
                          context.locale.toLanguageTag(),
                        ).format(chat.timestamp.toDate()),
                        style: Styles.textStyle14.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
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
      ),
    );
  }
}
