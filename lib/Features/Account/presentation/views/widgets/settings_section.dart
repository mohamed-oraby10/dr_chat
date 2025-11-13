import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_list_tile.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/logout_button.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/setting_dailog.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  String selectedLanguage = 'English';
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
          onTap: () async {
            final result = await showDialog<String>(
              context: context,
              builder: (context) {
                return SettingDailog(
                  option1: 'English',
                  option2: 'العربية',
                  selectedValue: selectedLanguage,
                  onChanged: (value) {
                    if (value == 'English') {
                      context.setLocale(Locale('en'));
                    } else if (value == 'العربية') {
                      context.setLocale(Locale('ar'));
                    }
                    GoRouter.of(context).pop();
                  },
                );
              },
            );
            if (result != null) {
              setState(() {
                selectedLanguage = result;
              });
            }
          },
        ),
        AccountListTile(
          text: 'Appearance',
          icon: FontAwesomeIcons.solidMoon,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SettingDailog(
                  option1: 'Light',
                  option2: 'Dark',
                  selectedValue: '1',
                );
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
