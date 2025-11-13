import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Auth/data/models/login_successfully_data_model.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/password_field.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/policy_row.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/widgets/main_button.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  String? email, password, confirmedPassword;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          GoRouter.of(context).go(
            AppRouter.kLoginSucceffullyView,
            extra: LoginSuccessfullyDataModel(
              title: 'Your account successfully created!',
              desc:
                  'Welcome to Your Virtual Psychology Assistant! Your account is created. Start your first session and take a step toward better mental health.',
            ),
          );
        } else if (state is RegisterFailure) {
          showCustomSnakBar(context, content: state.errMessage);
        }
      },
      builder: (context, state) {
        final isLoading = state is RegisterLoading;
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
            SizedBox(height: 20.h),
            PasswordField(
              hintText: 'Confirm Password',
              onChanged: (value) => confirmedPassword = value,
              onTap: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              obscureConfirmedPassword: obscureConfirmPassword,
            ),
            SizedBox(height: 20.h),
            RegisterPolicyRow(
              onChanged: (value) {
                setState(() {
                  checkBoxValue = value!;
                });
              },
              value: checkBoxValue,
            ),
            SizedBox(height: 40.h),
            MainButton(
              isLoading: isLoading,
              text: 'Create Account',
              onTap: () async {
                if (widget.formKey.currentState!.validate() &&
                    checkBoxValue == true) {
                  BlocProvider.of<RegisterCubit>(context).registerUser(
                    email: email!,
                    password: password!,
                    confirmedPassword: confirmedPassword!,
                  );
                } else {
                  showCustomSnakBar(
                    context,
                    content:
                        'You must agree to Privacy Policy and terms of use',
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
