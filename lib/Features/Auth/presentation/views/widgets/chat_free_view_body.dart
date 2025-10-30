import 'package:dr_chat/core/utils/assets_data.dart';
import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/routes.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:dr_chat/core/widgets/custom_clip_image.dart';
import 'package:dr_chat/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatFreeViewBody extends StatelessWidget {
  const ChatFreeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomClipImage(image: AssetsData.botImage),
          Text(
            textAlign: TextAlign.center,
            'Start chatting with Dr Chat now. You can ask me anything about therapy',
            style: Styles.textStyle18.copyWith(
              color: AppColors.primaryColor,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 30.h),
          MainButton(text: 'Start chat', onTap: () {}),
          SizedBox(height: 30.h),
          Text(
            textAlign: TextAlign.center,
            'Or login to keep your conversations',
            style: Styles.textStyle18.copyWith(
              color: AppColors.primaryColor,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 20.h),
          MainButton(
            text: 'Login',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLoginView);
            },
          ),
        ],
      ),
    );
  }
}
