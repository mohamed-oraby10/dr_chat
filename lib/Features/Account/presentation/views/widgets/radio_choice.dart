import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class RadioChoice extends StatelessWidget {
  const RadioChoice({super.key, required this.option});

  final String option;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(
      controlAffinity: ListTileControlAffinity.trailing,

      title: Text(
        option,
        style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
      ),
      value: 2,
      groupValue: null,
      onChanged: (int? value) {},
    );
  }
}
