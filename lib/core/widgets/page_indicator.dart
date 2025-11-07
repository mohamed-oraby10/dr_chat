import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Onboarding/data/onboarding_list.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      count: onboardinglist.length,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.primaryColor,
        dotColor: AppColors.secondColor,
        dotHeight: 8.h,
        dotWidth: 8.w,
        expansionFactor: 3,
      ),
      controller: pageController,
    );
  }
  }
