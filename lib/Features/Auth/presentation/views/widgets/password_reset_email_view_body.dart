import 'package:dr_chat/Features/Auth/presentation/views/widgets/password_reset_email_app_bar.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/resend_email_button_section.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/reset_email_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetEmailViewBody extends StatelessWidget {
  const PasswordResetEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: Column(
        children: [
          const PasswordResetEmailAppBar(),
          const ResetEmailTextSection(),
          const ResendEmailButtonSection(),
        ],
      ),
    );
  }
}
