import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/bottom_navigation_bar/bottom_navigation.dart';
import 'package:taskmate_app/Features/forgotpassword/forgot_password.dart';
import 'package:taskmate_app/Features/home/home_view.dart';
import 'package:taskmate_app/Features/login/presentation/views/login_view.dart';
import 'package:taskmate_app/Features/notification/views/notification_view.dart';
import 'package:taskmate_app/Features/profile%20all/profile/views/profile_view.dart';
import 'package:taskmate_app/Features/register/presentation/views/register_view.dart';
import 'package:taskmate_app/Features/splash/splash_view.dart';

class AppRoutes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String homeRoute = "/home";
  static const String profileRoute = "/profile";
  static const String settingsRoute = "/settings";
  static const String createTaskRoute = "/createTask";
  static const String taskDetailsRoute = "/taskDetails";
  static const String editTaskRoute = "/editTask";
  static const String taskListRoute = "/taskList";
  static const String notificationRoute = "/notification";
  static const bottomNavBarRoute = '/bottomNavBar';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: bottomNavBarRoute,
        builder: (context, state) => const CustomBottomNavBar(),
      ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: forgotPasswordRoute,
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
        path: homeRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: profileRoute,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: notificationRoute,
        builder: (context, state) => const NotificationView(),
      ),
    ],
  );
}
