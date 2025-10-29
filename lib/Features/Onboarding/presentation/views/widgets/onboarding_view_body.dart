import 'package:dr_chat/Features/Onboarding/data/onboarding_list.dart';
import 'package:dr_chat/Features/Onboarding/presentation/views/widgets/custom_onboarding.dart';
import 'package:dr_chat/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextView() {
    if (currentIndex < onboardinglist.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else {
      GoRouter.of(context).push(AppRouter.kLoginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onboardinglist.length,
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemBuilder: (context, index) {
        return CustomOnboarding(
          onboardingModel: onboardinglist[index],
          onTap: nextView,
          currentIndex: currentIndex,
          pageController: pageController,
        );
      },
    );
  }
}
