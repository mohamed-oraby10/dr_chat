import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.image, this.onTap, this.iconColor});
  final String image;
  final void Function()? onTap;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      icon: SvgPicture.asset(image, height: 45.h, width: 45.w,color: iconColor,),
    );
  }
}
