import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
  });
  final void Function()? onTap;
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          children: [
            Icon(icon, size: 24.sp),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                text,
                style: Styles.textStyle16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
