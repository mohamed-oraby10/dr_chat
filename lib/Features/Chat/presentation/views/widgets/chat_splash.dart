import 'package:easy_localization/easy_localization.dart';
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
          'chat.welcome_title'.tr(),
          style: Styles.textStyle22.copyWith(color: AppColors.primary(context)),
        ),
        SizedBox(height: 8.h),
        Text(
          'chat.welcome_subtitle'.tr(),
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
