
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/widgets/main_button.dart';

class ForgetPasswordSection extends StatefulWidget {
  const ForgetPasswordSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<ForgetPasswordSection> createState() => _ForgetPasswordSectionState();
}

class _ForgetPasswordSectionState extends State<ForgetPasswordSection> {
  String? email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          GoRouter.of(context).push(AppRouter.kPasswordResetEmailView);
        } else if (state is AuthFailure) {
          showCustomSnakBar(context, content: state.errMessage);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Column(
          children: [
            CustomTextFormField(
              onChanged: (value) => email = value,
              preIcon: Icon(Icons.email_rounded, color: Colors.black, size: 26),
              hintText: 'E-Mail',
            ),
            SizedBox(height: 30.h),
            MainButton(
              isLoading: isLoading,
              text: 'Submit',
              onTap: () {
                if (widget.formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(
                    context,
                  ).resetPassword(email: email!);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
