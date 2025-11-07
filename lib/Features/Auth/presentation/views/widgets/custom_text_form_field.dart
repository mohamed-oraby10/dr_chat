
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.sufIcon,
    required this.preIcon,
    required this.hintText,
    this.onChanged, this.obscureText,
  });
  final Widget? sufIcon;
  final Widget preIcon;
  final String hintText;
  final void Function(String)? onChanged;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false ,
      onChanged: onChanged,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5.w),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hint: Text(hintText, style: Styles.textStyle16),
        prefixIcon: preIcon,
        suffixIcon: sufIcon,
      ),
    );
  }
}
