
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Onboarding/data/models/onboarding_model.dart';
import 'package:new_dr_chat_application/Features/Onboarding/presentation/views/widgets/next_onboarding_view.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/custom_clip_image.dart';
import 'package:new_dr_chat_application/core/widgets/page_indicator.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({
    super.key,
    required this.onboardingModel,
    this.onTap,
    required this.currentIndex,
    required this.pageController,
  });
  final OnboardingModel onboardingModel;
  final void Function()? onTap;
  final int currentIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        CustomClipImage(image: onboardingModel.image),
        SizedBox(height: 20.h),

        Text(
          textAlign: TextAlign.center,
          onboardingModel.title,
          style: Styles.textStyle22.copyWith(color: AppColors.primaryColor),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            textAlign: TextAlign.center,
            onboardingModel.description,
            style: Styles.textStyle16.copyWith(color: AppColors.primaryColor),
          ),
        ),
        SizedBox(height: 50.h),
        OnboardingPageIndicator(pageController: pageController),
        SizedBox(height: 50.h),
        NextOnboardingView(onTap: onTap, currentIndex: currentIndex),
      ],
    );
  }
}
