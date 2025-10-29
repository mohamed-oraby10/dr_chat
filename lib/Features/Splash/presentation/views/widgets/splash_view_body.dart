import 'package:dr_chat/Features/Splash/presentation/views/widgets/custom_button.dart';
import 'package:dr_chat/core/utils/routes.dart';
import 'package:dr_chat/core/utils/assets_data.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.88,
              child: SvgPicture.asset(AssetsData.welcomeImage),
            ),
          ),
          SizedBox(height: 25.h),

          Text(
            textAlign: TextAlign.center,
            'Welcome to Dr Chat your personal therapist chatbot',
            style: Styles.textStyle22,
          ),
          SizedBox(height: 20.h),
          Text(
            textAlign: TextAlign.center,

            'Discover how Dr Chat can support your mental health journey with personalized,\n AI-driven therapy sessions',
            style: Styles.textStyle16,
          ),
          SizedBox(height: 65.h),
          CustomButton(
            onTap: () => GoRouter.of(context).push(AppRouter.kOnboardingView),
          ),
        ],
      ),
    );
  }
}
