import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/animated_text_response.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';

class RecievedChatBubble extends StatelessWidget {
  const RecievedChatBubble({super.key, required this.botRepaly});
  final String botRepaly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .7,
          ),
          decoration: BoxDecoration(
            color: AppColors.third(context),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: AnimatedTextResponse(botRepaly: botRepaly),
          ),
        ),
      ),
    );
  }
}
