
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/continue_section.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/register_section.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Let\'s create your account', style: Styles.textStyle22),
              SizedBox(height: 30.h),
              RegisterSection(formKey: formKey),
              SizedBox(height: 20.h),
              const ContinueWithGoogleSection(),
            ],
          ),
        ),
      ),
    );
  }
}
