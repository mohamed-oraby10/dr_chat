
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/account_view.dart';
import 'package:new_dr_chat_application/Features/Auth/data/models/login_successfully_data_model.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/chat_free_view.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/forget_password_view.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/login_successfully_view.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/login_view.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/password_reset_email_view.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/register_view.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/chat_view.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/history_view.dart';
import 'package:new_dr_chat_application/Features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:new_dr_chat_application/Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnboardingView = '/onboardingView';
  static const kLoginView = '/loginView';
  static const kChatFreeView = '/chatFreeView';
  static const kRegisterView = '/registerView';
  static const kLoginSucceffullyView = '/loginSucceffullyView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kPasswordResetEmailView = '/passwordResetEmailView';
  static const kChatView = '/chatView';
  static const kHistoryView = '/historyView';
  static const kAccountView = '/accountView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kChatFreeView,
        builder: (context, state) => const ChatFreeView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kForgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kLoginSucceffullyView,
        builder: (context, state) {
          final extra = state.extra;
          LoginSuccessfullyDataModel? data;
          if (extra is LoginSuccessfullyDataModel) {
            data = extra;
          }
          return LoginSuccessfullyView(title: data?.title, desc: data?.desc);
        },
      ),
      GoRoute(
        path: kPasswordResetEmailView,
        builder: (context, state) => const PasswordResetEmailView(),
      ),
      GoRoute(path: kChatView, builder: (context, state) => const ChatView()),
      GoRoute(
        path: kHistoryView,
        builder: (context, state) => const HistoryView(),
      ),
      GoRoute(
        path: kAccountView,
        builder: (context, state) => const AccountView(),
      ),
    ],
  );
}
