import 'package:dr_chat/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 55.h,
        width: 58.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(side: BorderSide(width: .8.w)),
          child: SvgPicture.asset(AssetsData.googleIcon),
        ),
      ),
    );
  }
}
