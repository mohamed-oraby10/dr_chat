import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/custom_container.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/main_button.dart';

class ChatFreeStack extends StatelessWidget {
  const ChatFreeStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomContainer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 25.h),
              Text(
                textAlign: TextAlign.center,
                'Start chatting with Dr Chat now. You can ask me anything about therapy',
                style: Styles.textStyle16.copyWith(),
              ),
              SizedBox(height: 30.h),
              MainButton(
                text: 'Start chat',
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kChatView,
                    extra: FirebaseFirestore.instance
                        .collection(kChats)
                        .doc()
                        .id,
                  );
                },
              ),
              SizedBox(height: 30.h),
              Text(
                textAlign: TextAlign.center,
                'Or login to keep your conversations',
                style: Styles.textStyle16.copyWith(),
              ),
              SizedBox(height: 20.h),
              MainButton(
                text: 'Login',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kLoginView);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
