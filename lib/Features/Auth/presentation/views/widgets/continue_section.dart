import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/google_button.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class ContinueWithGoogleSection extends StatelessWidget {
  const ContinueWithGoogleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Center(child: Text('Or sign in with', style: Styles.textStyle14)),
        SizedBox(height: 25.h),
        const GoogleButton(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const GoogleButton(),
        //     SizedBox(width: 15.w),
        //     const FacebookButton(),
        //   ],
        // ),
      ],
    );
  }
}
