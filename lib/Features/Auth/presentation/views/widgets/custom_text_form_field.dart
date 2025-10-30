import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.sufIcon,
    required this.preIcon,
    required this.hintText,
    this.onChanged,
  });
  final Widget? sufIcon;
  final Widget preIcon;
  final String hintText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hint: Text(hintText, style: Styles.textStyle16),
        prefixIcon: preIcon,
        suffixIcon: sufIcon,
      ),
    );
  }
}
