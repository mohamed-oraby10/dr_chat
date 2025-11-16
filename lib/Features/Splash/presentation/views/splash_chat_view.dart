import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';

class SplashChatView extends StatefulWidget {
  const SplashChatView({super.key});

  @override
  State<SplashChatView> createState() => _SplashChatViewState();
}

class _SplashChatViewState extends State<SplashChatView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;

      if (!mounted) return;

      if (user != null) {
        final chatId = FirebaseFirestore.instance.collection(kChats).doc().id;
        context.go('/chatView', extra: chatId);
      } else {
        context.go('/chatFreeView');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AssetsData.chatSplashIcon, height: 65.h),
      ),
    );
  }
}
