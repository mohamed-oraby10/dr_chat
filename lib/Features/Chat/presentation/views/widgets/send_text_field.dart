import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';

class SendTextField extends StatefulWidget {
  const SendTextField({super.key, required this.onSubmitted});
  final Function(String) onSubmitted;

  @override
  State<SendTextField> createState() => _SendTextFieldState();
}

class _SendTextFieldState extends State<SendTextField> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    void handleSend() {
      final text = controller.text.trim();
      if (text.isNotEmpty) {
        widget.onSubmitted(text);
        controller.clear();
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 300.w,
            child: TextField(
              autofocus: false,
              textInputAction: TextInputAction.send,
              controller: controller,
              onSubmitted: (_) => handleSend(),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.5.w,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 20.w,
                ),
                hintText: 'Type your message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => handleSend(),
            child: SvgPicture.asset(
              AssetsData.sendIcon,
              height: 50.h,
              width: 50.w,
            ),
          ),
        ],
      ),
    );
  }
}
