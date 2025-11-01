import 'package:dr_chat/Features/Auth/presentation/views/chat_free_view.dart';
import 'package:dr_chat/Features/Auth/presentation/views/forget_password_view.dart';
import 'package:dr_chat/Features/Auth/presentation/views/login_successfully_view.dart';
import 'package:dr_chat/Features/Auth/presentation/views/login_view.dart';
import 'package:dr_chat/Features/Auth/presentation/views/password_reset_email_view.dart';
import 'package:dr_chat/Features/Auth/presentation/views/register_view.dart';
import 'package:dr_chat/Features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:dr_chat/Features/Splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnboardingView = '/onboardingView';
  static const kLoginView = '/loginView';
  static const kChatFreeView = '/chatFreeView';
  static const kRegisterView = '/registerView';
  static const kLoginSucceffullyView = '/loginSucceffullyView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kLoginSuccessfullyView = '/loginSuccessfullyView';
  static const kPasswordResetEmailView = '/passwordResetEmailView';

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
        builder: (context, state) => const LoginSuccessfullyView(),
      ),
        GoRoute(
        path: kPasswordResetEmailView,
        builder: (context, state) => const PasswordResetEmailView(),
      ),
    ],
  );
}
