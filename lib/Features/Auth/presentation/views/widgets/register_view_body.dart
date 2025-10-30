import 'package:dr_chat/Features/Auth/presentation/views/widgets/continue_section.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/register_section.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/text_fields_section.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Let\'s create your account', style: Styles.textStyle22),
          SizedBox(height: 30.h),
          const TextFieldsSection(),
          SizedBox(height: 20.h),
          const RegisterSection(),
          const ContinueWithGoogleSection(),
        ],
      ),
    );
  }
}
