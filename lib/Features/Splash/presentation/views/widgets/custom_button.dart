
import 'package:dr_chat/core/utils/colors.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 170.w,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
        onPressed: () {},
        child: Text(
          'Let\'s Go',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
