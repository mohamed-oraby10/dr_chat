import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/core/services/local_storage_service.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = LocalStorageService.instance.getTheme();
  void toggleTheme({required bool value}) async {
    isDark = value;
    await LocalStorageService.instance.setTheme(isDark: value);
    notifyListeners();
  }
  //  ThemeData get theme {
  //   return ThemeData(
  //     colorScheme: isDark ? darkScheme : lightScheme,
  //     useMaterial3: true,
  //   );
  // }
}
