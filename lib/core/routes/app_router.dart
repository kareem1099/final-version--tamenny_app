import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/home_bottom_nav_bar.dart';
import 'package:tamenny_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:tamenny_app/features/onboarding/presentation/views/welcome_view.dart';
import '../../features/chatbot/presentation/views/chat_bot_view.dart';
import '../../features/profiel/presentation/views/personal_info_view.dart';

import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/views/health_scan_categories_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../scan/presentation/views/completed_screen.dart';
import '../../scan/presentation/views/processing_screen.dart';
import '../../scan/presentation/views/scan_analysis_results.dart';
import '../../scan/presentation/views/scan_view.dart';
import '../../scan/presentation/views/upload_file_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onboardingView:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );
      case Routes.welcomeView:
        return MaterialPageRoute(
          builder: (context) => const WelcomeView(),
        );
      case Routes.scanView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ScanView(),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginView(),
          ),
        );
      case Routes.signupView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignupView(),
          ),
        );
      case Routes.forgotPasswordView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgotPasswordView(),
          ),
        );
      case Routes.bottomNavBarView:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case Routes.processingScreen:
        return MaterialPageRoute(
          builder: (context) => const ProcessingScreen(),
        );
      case Routes.uploadFileView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>  UploadFileView(),
        );
      case Routes.healthScanCategoriesView:
        return MaterialPageRoute(
          builder: (context) => HealthScanCategoriesView(),
        );
      case Routes.notificationView:
        return MaterialPageRoute(
          builder: (context) => const NotificationView(),
        );
      case Routes.completedScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>  CompletedScreen(),
        );
      case Routes.scanAnalysisResultsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ScanAnalysisResults(),
        ); case Routes.personalInfoView:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const PersonalInfoView(),
      );
      case Routes.chatBotView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ChatBotView(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route Defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
