import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackArrowIconButton extends StatelessWidget {
  const BackArrowIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, size: 28.sp),
      onPressed: () => Navigator.pop(context),
    );
  }
}
