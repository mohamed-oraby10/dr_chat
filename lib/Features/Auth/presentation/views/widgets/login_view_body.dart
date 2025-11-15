import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/login_with_google_cubit/login_with_google_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/continue_section.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/login_section.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/second_button.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/custom_circular_indicator.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocBuilder<LoginWithGoogleCubit, LoginWithGoogleState>(
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CustomCircularIndicator(forColor: AppColors.primaryColor,),
          inAsyncCall: state is LoginWithGoogleLoading,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 55.h),
                    Text("Welcome back", style: Styles.textStyle22),
                    SizedBox(height: 30.h),
                    LoginSection(formKey: formKey),
                    SizedBox(height: 25.h),
                    SecondButton(
                      text: 'Create Account',
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView);
                      },
                    ),
                    SizedBox(height: 20.h),
                    const ContinueWithGoogleSection(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
