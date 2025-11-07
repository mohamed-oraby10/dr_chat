import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/cancel_button.dart';
import 'package:new_dr_chat_application/Features/Splash/presentation/views/widgets/custom_button.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class DeleteHistoryBottomSheet extends StatelessWidget {
  const DeleteHistoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      height: MediaQuery.of(context).size.height * .27,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Clear All History', style: Styles.textStyle22),
          SizedBox(height: 30.h),
          Text(
            'Are you sure you want to clear all history?',
            style: Styles.textStyle16,
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CancelButton(),
              SizedBox(width: 16.w),
              CustomButton(text: 'Clear All History'),
            ],
          ),
        ],
      ),
    );
  }
}
