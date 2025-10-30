import 'package:dr_chat/Features/Auth/presentation/views/widgets/check_box.dart';
import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RegisterPolicyRow extends StatelessWidget {
  const RegisterPolicyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
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
