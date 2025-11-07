
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/forget_password_row.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/password_field.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/widgets/main_button.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  String? email, password;
  bool obscurePassword = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          GoRouter.of(context).push(AppRouter.kLoginSucceffullyView);
        } else if (state is AuthFailure) {
          showCustomSnakBar(context, content: state.errMessage);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Column(
          children: [
            CustomTextFormField(
              preIcon: Icon(
                Icons.email_rounded,
                color: Colors.black,
                size: 26.sp,
              ),
              hintText: 'E-Mail',
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 20.h),
            PasswordField(
              onChanged: (value) => password = value,
              onTap: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              obscurePassword: obscurePassword,
            ),
            SizedBox(height: 8.h),
            ForgetPasswordRow(
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
              value: isChecked,
            ),
            SizedBox(height: 50.h),
            MainButton(
              isLoading: isLoading,
              text: 'Sign In',
              onTap: () async {
                if (widget.formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(
                    context,
                  ).loginUser(email: email!, password: password!);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
