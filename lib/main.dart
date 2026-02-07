import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dr_chat_application/core/init/app_initializer.dart';
import 'package:new_dr_chat_application/core/observers/bloc_observer.dart';
import 'package:new_dr_chat_application/core/providers/theme_provider.dart';
import 'package:new_dr_chat_application/core/services/local_storage_service.dart';
import 'package:new_dr_chat_application/dr_chat.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitializer.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyLocalization(
      startLocale: Locale(LocalStorageService.instance.getLanguage()),
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const DrChat(),
      ),
    ),
  );
}
