import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/core/di/service_locator.dart';
import 'package:new_dr_chat_application/core/observers/bloc_observer.dart';
import 'package:new_dr_chat_application/core/services/local_storage_service.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  await LocalStorageService.instance.init();
  runApp(
    EasyLocalization(
      startLocale: Locale(LocalStorageService.instance.getLanguage()),
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: const DrChat(),
    ),
  );
}

class DrChat extends StatelessWidget {
  const DrChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411.4, 866.28),
      minTextAdapt: true,
      builder: (context, child) {
        final String fontFamily;
        final local = context.locale;
        if (local.languageCode == 'ar') {
          fontFamily = 'Cairo';
        } else {
          fontFamily = 'Poppins';
        }
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: fontFamily,
          ),
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
