import 'package:dr_chat/Features/Auth/presentation/views/widgets/login_view_body.dart';
import 'package:dr_chat/core/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondColor,
      body: LoginViewBody(),
    );
  }
}
