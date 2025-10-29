import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    this.onTap,
  });
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 120.w,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                borderRadius ??
                BorderRadius.only(
                  topRight: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r),
                ),
          ),
        ),
        child: Text(text, style: Styles.textStyle18.copyWith(color: textColor)),
      ),
    );
  }
}
