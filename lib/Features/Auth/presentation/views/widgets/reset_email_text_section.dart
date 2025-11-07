
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/custom_clip_image.dart';

class ResetEmailTextSection extends StatelessWidget {
  const ResetEmailTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 280.h,
          child: CustomClipImage(image: AssetsData.sentMail),
        ),
        Text(
          textAlign: TextAlign.center,
          'Password Reset Email Sent',
          style: Styles.textStyle22,
        ),
        SizedBox(height: 15.h),
        Text(
          textAlign: TextAlign.center,
          'mohamedoraby@gmail.com',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.h),
        Text(
          textAlign: TextAlign.center,
          'Your Account Security is Our Priority! We\'ve sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
