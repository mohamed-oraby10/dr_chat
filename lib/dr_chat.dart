import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/core/app_keys.dart';
import 'package:new_dr_chat_application/core/providers/theme_provider.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:provider/provider.dart';

class DrChat extends StatelessWidget {
  const DrChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411.4, 866.28),
      minTextAdapt: true,
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final local = context.locale;
        final String fontFamily = local.languageCode == 'ar'
            ? 'Cairo'
            : 'Poppins';
        return MaterialApp.router(
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: themeProvider.isDark
              ? ThemeData.dark().copyWith(
                  textTheme: ThemeData.dark().textTheme.apply(
                    fontFamily: fontFamily,
                  ),
                )
              : ThemeData.light().copyWith(
                  textTheme: ThemeData.light().textTheme.apply(
                    fontFamily: fontFamily,
                  ),
                ),
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
