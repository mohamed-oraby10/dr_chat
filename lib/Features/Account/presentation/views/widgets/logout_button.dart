import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_list_tile.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/logout_cubit/logout_cubit.dart';
import 'package:new_dr_chat_application/core/providers/theme_provider.dart';
import 'package:new_dr_chat_application/core/services/local_storage_service.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          GoRouter.of(context).go(AppRouter.kChatFreeView);
        } else if (state is Logoutfailure) {
          showCustomSnakBar(context, content: state.errMessage);
        }
      },
      builder: (context, state) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return ModalProgressHUD(
          inAsyncCall: state is LogoutLoading,
          child: AccountListTile(
            onTap: () {
              themeProvider.toggleTheme(value: false);
              context.setLocale(const Locale('en'));
              LocalStorageService.instance.setLanguage(languageCode: 'en');
              BlocProvider.of<LogoutCubit>(context).logoutUser();
            },
            text: 'account.logout'.tr(),
            icon: FontAwesomeIcons.arrowRightFromBracket,
          ),
        );
      },
    );
  }
}
