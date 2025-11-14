import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/personal_info_section.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/settings_section.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('account.title'.tr(), style: Styles.textStyle22),
          SizedBox(height: 30.h),
          PersonalInfoSection(),
          SizedBox(height: 30.h),
          SettingsSection(
            onChangedLanguage: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
