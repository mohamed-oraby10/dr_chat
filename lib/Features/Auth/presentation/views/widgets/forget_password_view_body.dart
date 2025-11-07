import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/forget_password_app_bar.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/forget_password_section.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ForgetPasswordAppBar(),
            SizedBox(height: 10.h),
            Text('Forget password', style: Styles.textStyle22),
            SizedBox(height: 10.h),
            Text(
              'Don\'t worry sometimes people can forget too, enter your email and we will send you a password reset link',
              style: Styles.textStyle14,
            ),
            SizedBox(height: 50.h),
            ForgetPasswordSection(formKey: formKey),
          ],
        ),
      ),
    );
  }
}
