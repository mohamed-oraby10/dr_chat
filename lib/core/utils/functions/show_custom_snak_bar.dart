import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

void showCustomSnakBar(context, {required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primary(context),
      content: Text(content, style: Styles.textStyle14),
    ),
  );
}
