import 'package:dr_chat/Features/Onboarding/presentation/views/widgets/custom_text_button.dart';
import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NextOnboardingView extends StatelessWidget {
  const NextOnboardingView({super.key, this.onTap, required this.currentIndex});
  final void Function()? onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextButton(
          text: 'Skip',
          backgroundColor: AppColors.thirdColor,
          textColor: AppColors.primaryColor,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kChatFreeView);
          },
        ),
        CustomTextButton(
          onTap: onTap,
          text: 'Next',
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            bottomLeft: Radius.circular(25.r),
          ),
        ),
      ],
    );
  }
}
