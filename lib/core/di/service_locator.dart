import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo_implementation.dart';
import 'package:new_dr_chat_application/core/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<ChatRepoImplementation>(
    ChatRepoImplementation(apiService: getIt.get<ApiService>()),
  );
}
