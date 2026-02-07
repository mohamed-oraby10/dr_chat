import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_dr_chat_application/core/di/service_locator.dart';
import 'package:new_dr_chat_application/core/services/local_storage_service.dart';
import 'package:new_dr_chat_application/firebase_options.dart';

class AppInitializer {
  static Future<void> init() async {
    await initFirebase();
    await initLocalization();
    setupLocator();
    await initLocalStorage();
  }

  static Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void setupLocator() {
    setupServiceLocator();
  }

  static Future<void> initLocalization() async {
    await EasyLocalization.ensureInitialized();
  }

  static Future<void> initLocalStorage() async {
    await LocalStorageService.instance.init();
  }
}
