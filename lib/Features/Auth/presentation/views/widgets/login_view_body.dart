import 'package:dr_chat/Features/Auth/presentation/views/widgets/continue_section.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/forget_password_row.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/login_section.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/text_fields_section.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back,", style: Styles.textStyle22),
              SizedBox(height: 30.h),
              const TextFieldsSection(),
              SizedBox(height: 8.h),
              const ForgetPasswordRow(),
              const LoginSection(),
              const ContinueWithGoogleSection(),
            ],
          ),
        ),
      ),
    );
  }
}
