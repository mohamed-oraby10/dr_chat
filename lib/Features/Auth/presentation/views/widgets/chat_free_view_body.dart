import 'package:dr_chat/core/utils/assets_data.dart';
import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:dr_chat/core/widgets/custom_clip_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatFreeViewBody extends StatelessWidget {
  const ChatFreeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
        ],
      ),
    );
  }
}
