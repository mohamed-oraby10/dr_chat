
import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/check_box.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class RegisterPolicyRow extends StatelessWidget {
  const RegisterPolicyRow({super.key, this.onChanged, this.value});
  final void Function(bool?)? onChanged;
  final bool? value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(onChanged: onChanged, value: value),
        Text('I agree to  ', style: Styles.textStyle14),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            'Privacy Policy',
            style: Styles.textStyle14.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text('  and Terms of use', style: Styles.textStyle14),
      ],
    );
  }
}
