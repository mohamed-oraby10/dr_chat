import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
          activeColor: AppColors.primaryColor,
        ),
        Text('Remember Me', style: Styles.textStyle14),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forget password?',
            style: Styles.textStyle14.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
