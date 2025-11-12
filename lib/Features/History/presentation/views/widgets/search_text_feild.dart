import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: TextField(onChanged: onChanged),
    );
  }
}
