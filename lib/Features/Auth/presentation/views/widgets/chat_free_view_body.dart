
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/chat_free_stack.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/widgets/custom_clip_image.dart';

class ChatFreeViewBody extends StatelessWidget {
  const ChatFreeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: SizedBox(
            height: 370.h,
            child: CustomClipImage(image: AssetsData.botImage),
          ),
        ),

        const Spacer(),
       const ChatFreeStack(),
      ],
    );
  }
}
