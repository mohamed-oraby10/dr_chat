import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';

class ChatViewAppBarActions extends StatelessWidget {
  const ChatViewAppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).go(
              AppRouter.kChatView,
              extra: FirebaseFirestore.instance.collection(kChats).doc().id,
            );
          },
          icon: Icon(FontAwesomeIcons.penToSquare, size: 25.sp),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kHistoryView);
          },
          icon: Icon(FontAwesomeIcons.clockRotateLeft, size: 25.sp),
        ),
      ],
    );
  }
}
