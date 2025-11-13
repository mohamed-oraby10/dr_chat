import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 180.w,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
        onPressed: onTap,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
