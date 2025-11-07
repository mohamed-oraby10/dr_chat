import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/core/widgets/main_button.dart';
import '../../../../../core/utils/styles.dart';

class ResendEmailButtonSection extends StatelessWidget {
  const ResendEmailButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        MainButton(text: 'Done', onTap: () {}),
        SizedBox(height: 25.h),
        TextButton(
          onPressed: () {},
          child: Text(
            'Resend Email',
            style: Styles.textStyle18.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
