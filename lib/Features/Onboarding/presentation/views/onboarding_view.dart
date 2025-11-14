import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Onboarding/presentation/views/widgets/onboarding_view_body.dart';
import 'dart:ui' as ui;

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(
          textDirection: ui.TextDirection.ltr,
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: OnboardingViewBody()),
    );
  }
}
