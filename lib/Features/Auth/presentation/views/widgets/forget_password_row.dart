import 'package:dr_chat/Features/Auth/presentation/views/widgets/check_box.dart';
import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/routes.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text('Remember Me', style: Styles.textStyle14),
        const Spacer(),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kForgetPasswordView);
          },
          child: Text(
            'Forget password?',
            style: Styles.textStyle14.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
