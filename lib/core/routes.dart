import 'package:go_router/go_router.dart';
import 'package:taskmate_app/Features/add_tasks/presentation/views/add_task_view.dart';
import 'package:taskmate_app/Features/bottom_navigation_bar/bottom_navigation.dart';
import 'package:taskmate_app/Features/forgotpassword/forgot_password.dart';
import 'package:taskmate_app/Features/home/home_view.dart';
import 'package:taskmate_app/Features/login/presentation/views/login_view.dart';
import 'package:taskmate_app/Features/notification/views/notification_view.dart';
import 'package:taskmate_app/Features/profile_options/change_password/presentation/views/ch_pass_views.dart';
import 'package:taskmate_app/Features/profile_options/profile/views/profile_view.dart';
import 'package:taskmate_app/Features/profile_options/settings/views/setting_view.dart';
import 'package:taskmate_app/Features/profile_options/update_profile/presentation/views/updata_profile.dart';
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
  static const String bottomNavBarRoute = '/bottomNavBar';
  static const String changePasswordRoute = '/changePassword';
  static const String updateProfileRoute = '/updateProfile';
  static const String addTaskRoute = '/addTask';

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
      GoRoute(
        path: settingsRoute,
        builder: (context, state) => const SettingView(),
      ),
      GoRoute(
        path: changePasswordRoute,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: updateProfileRoute,
        builder: (context, state) => const UpdataProfile(),
      ),
      GoRoute(
        path: addTaskRoute,
        builder: (context, state) => const AddTaskView(),
      ),
    ],
  );
}
