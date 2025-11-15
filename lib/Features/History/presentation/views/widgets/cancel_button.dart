import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 170.w,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: AppColors.third(context)),
        onPressed: () {
          GoRouter.of(context).pop();
        },
        child: Text(
          "history.cancel_button".tr(),
          style: Styles.textStyle18.copyWith(
            color: AppColors.primary(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
