import 'package:dr_chat/Features/Auth/presentation/views/widgets/google_button.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueWithGoogleSection extends StatelessWidget {
  const ContinueWithGoogleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Center(child: Text('Or sign in with', style: Styles.textStyle14)),
        SizedBox(height: 25.h),
        const GoogleButton(),
      ],
    );
  }
}
