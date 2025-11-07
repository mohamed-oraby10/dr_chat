import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, this.onChanged, this.value});
  final void Function(bool?)? onChanged;
  final bool? value;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value ?? false,
      onChanged: onChanged,
      activeColor: AppColors.primaryColor,
    );
  }
}
