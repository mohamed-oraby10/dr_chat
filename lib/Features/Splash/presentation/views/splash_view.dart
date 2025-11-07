import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Splash/presentation/views/widgets/splash_view_body.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.thirdColor,
      body: SplashViewBody(),
    );
  }
}
