import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class RadioChoice extends StatelessWidget {
  const RadioChoice({
    super.key,
    required this.option,
    required this.selectedValue,
    this.onChanged,
    required this.value,
  });

  final String option;
  final String value;
  final String selectedValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        option,
        style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
      ),
      value: value,
      groupValue: selectedValue,
      onChanged: onChanged,
    );
  }
}
