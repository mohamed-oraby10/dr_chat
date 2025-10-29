import 'package:dr_chat/Features/Auth/presentation/views/login_view.dart';
import 'package:dr_chat/Features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:dr_chat/Features/Splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnboardingView = '/onboardingView';
    static const kLoginView = '/loginView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kOnboardingView,builder: (context, state) => const OnboardingView(),),
            GoRoute(path: kLoginView,builder: (context, state) => const LoginView(),),

    ],
  );
}
