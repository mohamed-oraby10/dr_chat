import 'package:dr_chat/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/forget_password_app_bar.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:dr_chat/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
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
          CustomTextFormField(
            preIcon: Icon(Icons.email_rounded, color: Colors.black, size: 26),
            hintText: 'E-Mail',
          ),
          SizedBox(height: 30.h),
          MainButton(text: 'Submit', onTap: () {}),
        ],
      ),
    );
  }
}
