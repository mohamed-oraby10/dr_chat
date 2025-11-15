import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/core/app_keys.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

void showCustomSnakBar(context, {required String content}) {
  rootScaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Text(
        content,
        style: Styles.textStyle14.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
