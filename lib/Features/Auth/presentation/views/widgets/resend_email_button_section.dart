import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/widgets/main_button.dart';
import '../../../../../core/utils/styles.dart';

class ResendEmailButtonSection extends StatelessWidget {
  const ResendEmailButtonSection({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        MainButton(
          text: 'Done',
          onTap: () {
            GoRouter.of(context).pop();
          },
        ),
        SizedBox(height: 25.h),
        BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordFailure) {
              showCustomSnakBar(context, content: state.errMessage);
            } else if (state is ResetPasswordSuccess) {
              showCustomSnakBar(
                context,
                content: 'Link sent for $email successfully',
              );
            }
          },
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                BlocProvider.of<ResetPasswordCubit>(
                  context,
                ).resetPassword(email: email);
              },
              child: Text(
                'Resend Email',
                style: Styles.textStyle18.copyWith(color: Colors.black),
              ),
            );
          },
        ),
      ],
    );
  }
}
