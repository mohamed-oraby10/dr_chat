import 'package:dr_chat/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      count: 7,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.primaryColor,
        dotColor: Colors.white,
        dotHeight: 8.h,
        dotWidth: 8.w,
        expansionFactor: 3,
      ),
      controller: PageController(),
    );
  }
}
