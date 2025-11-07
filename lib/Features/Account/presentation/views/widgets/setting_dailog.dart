import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/radio_choice.dart';

class SettingDailog extends StatelessWidget {
  const SettingDailog({
    super.key,
    required this.option1,
    required this.option2,
  });
  final String option1;
  final String option2;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 60.w,
        height: 140.h,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioChoice(option: option1),
              RadioChoice(option: option2),
            ],
          ),
        ),
      ),
    );
  }
}
