import 'package:dr_chat/Features/Auth/presentation/views/widgets/text_fields_section.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome back,", style: Styles.textStyle22),
          SizedBox(height: 30.h),
          const TextFieldsSection(),
        ],
      ),
    );
  }
}



