import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_list_tile.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/setting_dailog.dart';
import 'package:new_dr_chat_application/core/services/local_storage_service.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key, required this.onChangedLanguage});
  final VoidCallback onChangedLanguage;

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  late String selectedLanguage;
  @override
  void initState() {
    super.initState();
    selectedLanguage = LocalStorageService.instance.getLanguage() == 'ar'
        ? 'العربية'
        : 'English';
  }

  @override
  Widget build(BuildContext context) {
    return AccountListTile(
      text: 'account.language'.tr(),
      icon: FontAwesomeIcons.globe,
      onTap: () async {
        final value = await showDialog<String>(
          context: context,
          builder: (context) {
            return SettingDailog(
              value1: 'English',
              value2: 'العربية',
              option1: 'English',
              option2: 'العربية',
              selectedValue: selectedLanguage,
              onChanged: (value) {
                if (value == 'English') {
                  LocalStorageService.instance.setLanguage(languageCode: 'en');
                  context.setLocale(Locale('en'));
                } else if (value == 'العربية') {
                  LocalStorageService.instance.setLanguage(languageCode: 'ar');
                  context.setLocale(Locale('ar'));
                }
                GoRouter.of(context).pop(value);
              },
            );
          },
        );
        if (value != null) {
          setState(() {
            selectedLanguage = value;
          });
        }
        widget.onChangedLanguage.call();
      },
    );
  }
}
