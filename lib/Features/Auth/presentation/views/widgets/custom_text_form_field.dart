
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.sufIcon, required this.preIcon, required this.hintText});
  final Widget? sufIcon;
  final Widget preIcon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hint: Text(hintText, style: Styles.textStyle16),
        prefixIcon: preIcon,
        suffixIcon: sufIcon,
      ),
    );
  }
}
