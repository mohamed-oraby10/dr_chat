import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_list_tile.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/setting_dailog.dart';
import 'package:new_dr_chat_application/core/providers/theme_provider.dart';
import 'package:new_dr_chat_application/core/services/local_storage_service.dart';
import 'package:provider/provider.dart';

class AppearanceDialog extends StatefulWidget {
  const AppearanceDialog({super.key});

  @override
  State<AppearanceDialog> createState() => _AppearanceDialogState();
}

class _AppearanceDialogState extends State<AppearanceDialog> {
  late String selectedTheme;
  @override
  void initState() {
    super.initState();
    selectedTheme = LocalStorageService.instance.getTheme() == false
        ? 'Light'
        : 'Dark';
  }

  @override
  Widget build(BuildContext context) {
    return AccountListTile(
      text: 'account.appearance'.tr(),
      icon: FontAwesomeIcons.solidMoon,
      onTap: () async {
        final value = await showDialog(
          context: context,
          builder: (context) {
            final themeProvider = Provider.of<ThemeProvider>(
              context,
              listen: false,
            );
            return SettingDailog(
              value1: 'Light',
              value2: 'Dark',
              option1: 'account.theme_light'.tr(),
              option2: 'account.theme_dark'.tr(),
              selectedValue: selectedTheme,
              onChanged: (value) {
                if (value == 'Light') {
                  LocalStorageService.instance.setTheme(isDark: false);
                  themeProvider.toggleTheme(value: false);
                } else if (value == 'Dark') {
                  LocalStorageService.instance.setTheme(isDark: true);
                  themeProvider.toggleTheme(value: true);
                }
                GoRouter.of(context).pop(value);
              },
            );
          },
        );
        setState(() {
          selectedTheme = value ?? selectedTheme;
        });
      },
    );
  }
}
