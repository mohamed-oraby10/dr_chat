import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/personal_info_section.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/settings_section.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account', style: Styles.textStyle22),
          SizedBox(height: 30.h),
          PersonalInfoSection(),
          SizedBox(height: 30.h),
          SettingsSection(),
        ],
      ),
    );
  }
}
