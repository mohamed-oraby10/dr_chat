import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key, this.forColor});
  final Color? forColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 25.h,
        width: 25.w,
        child: CircularProgressIndicator(color: forColor ?? Colors.white, strokeWidth: 1.5),
      ),
    );
  }
}
