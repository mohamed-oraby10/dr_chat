
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Splash/presentation/views/widgets/custom_button.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/custom_clip_image.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomClipImage(image: AssetsData.welcomeImage),
          SizedBox(height: 25.h),
          Text(
            textAlign: TextAlign.center,
            'Welcome to Dr Chat your personal therapist chatbot',
            style: Styles.textStyle22,
          ),
          SizedBox(height: 20.h),
          Text(
            textAlign: TextAlign.center,
            'Discover how Dr Chat can support your mental health journey with personalized, AI-driven \ntherapy sessions',
            style: Styles.textStyle14.copyWith(color: Colors.black),
          ),
          SizedBox(height: 70.h),
          CustomButton(
            onTap: () => GoRouter.of(context).push(AppRouter.kOnboardingView), text:  'Let\'s Go',
          ),
        ],
      ),
    );
  }
}
