
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(AuthRepoImplementation()),
      child: Scaffold(body: SafeArea(child: ForgetPasswordViewBody())),
    );
  }
}
