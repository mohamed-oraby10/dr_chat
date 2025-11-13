import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_list_tile.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/logout_button.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/setting_dailog.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Settings', style: Styles.textStyle14.copyWith(fontSize: 15)),
        SizedBox(height: 10.h),
        AccountListTile(
          text: 'Language',
          icon: FontAwesomeIcons.globe,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SettingDailog(option1: 'English', option2: 'العربية');
              },
            );
          },
        ),
        AccountListTile(
          text: 'Appearance',
          icon: FontAwesomeIcons.solidMoon,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SettingDailog(option1: 'Light', option2: 'Dark');
              },
            );
          },
        ),
        AccountListTile(text: 'Help Center', icon: FontAwesomeIcons.circleInfo),
        const LogoutButton(),
      ],
    );
  }
}
