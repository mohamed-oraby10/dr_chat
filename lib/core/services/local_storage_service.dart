import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService._();
  static final LocalStorageService instance = LocalStorageService._();
  SharedPreferences? pref;
  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> setLanguage({required String languageCode}) async {
    await pref?.setString('language', languageCode);
  }

  String getLanguage() {
    return pref?.getString('language') ?? 'en';
  }

  Future<void> setTheme({required bool isDark}) async {
    await pref?.setBool('theme', isDark);
  }

  bool getTheme() {
    return pref?.getBool('theme') ?? false;
  }
}
