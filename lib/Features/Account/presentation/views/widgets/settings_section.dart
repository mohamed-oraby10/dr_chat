import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_list_tile.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/language_dialog.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/logout_button.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/setting_dailog.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.onChangedLanguage});
  final VoidCallback onChangedLanguage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'account.settings'.tr(),
          style: Styles.textStyle14.copyWith(fontSize: 15),
        ),
        SizedBox(height: 10.h),
        LanguageDialog(onChangedLanguage: onChangedLanguage,),
        AccountListTile(
          text: 'account.appearance'.tr(),
          icon: FontAwesomeIcons.solidMoon,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SettingDailog(
                  option1: 'account.theme_light'.tr(),
                  option2: 'account.theme_dark'.tr(),
                  selectedValue: '1',
                );
              },
            );
          },
        ),
        AccountListTile(
          text: 'account.help_center'.tr(),
          icon: FontAwesomeIcons.circleInfo,
        ),
         LogoutButton(),
      ],
    );
  }
}
