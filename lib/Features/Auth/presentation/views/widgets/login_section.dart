import 'package:dr_chat/Features/Auth/presentation/views/widgets/second_button.dart';
import 'package:dr_chat/core/utils/routes.dart';
import 'package:dr_chat/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        MainButton(
          text: 'Sign In',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kLoginSucceffullyView);
          },
        ),
        SizedBox(height: 25.h),
        SecondButton(
          text: 'Create Account',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kRegisterView);
          },
        ),
      ],
    );
  }
}
