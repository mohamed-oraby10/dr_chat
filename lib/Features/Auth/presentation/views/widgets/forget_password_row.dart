
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/check_box.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({super.key, this.onChanged, this.value});
final void Function(bool?)? onChanged;
  final bool? value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CustomCheckBox(onChanged:onChanged ,value: value,),
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
