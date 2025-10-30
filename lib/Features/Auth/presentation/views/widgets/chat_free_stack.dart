import 'package:dr_chat/Features/Auth/presentation/views/widgets/custom_container.dart';
import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/routes.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:dr_chat/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatFreeStack extends StatelessWidget {
  const ChatFreeStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomContainer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 25.h),
              Text(
                textAlign: TextAlign.center,
                'Start chatting with Dr Chat now. You can ask me anything about therapy',
                style: Styles.textStyle16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 30.h),
              MainButton(text: 'Start chat', onTap: () {}),
              SizedBox(height: 30.h),
              Text(
                textAlign: TextAlign.center,
                'Or login to keep your conversations',
                style: Styles.textStyle16.copyWith(
                  color: AppColors.primaryColor,
                ),
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
