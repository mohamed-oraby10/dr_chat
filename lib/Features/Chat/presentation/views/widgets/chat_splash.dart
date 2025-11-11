import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class ChatSplash extends StatelessWidget {
  const ChatSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetsData.chatSplashIcon, height: 65.h),
        SizedBox(height: 12.h),
        Text(
          'Hi, I\'m Dr Chat',
          style: Styles.textStyle22.copyWith(color: AppColors.primaryColor),
        ),
        SizedBox(height: 8.h),
        Text(
          'Small talks can lead to big healing.',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
