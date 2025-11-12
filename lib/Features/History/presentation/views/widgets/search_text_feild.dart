import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({super.key, this.onChanged, this.onPress});
  final void Function(String)? onChanged;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.w,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search here',
          suffixIcon: IconButton(
            onPressed: onPress,
            icon: Icon(FontAwesomeIcons.xmark),
          ),
        ),
      ),
    );
  }
}
