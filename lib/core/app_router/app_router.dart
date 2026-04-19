import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/app_router/app_router_keys.dart';
import 'package:todo_nti5/features/auth/views/login/login_screen.dart';
import 'package:todo_nti5/features/auth/views/register/register_screen.dart';
import 'package:todo_nti5/features/profile/views/chande_password/change_password_screen.dart';
import 'package:todo_nti5/features/profile/views/profile_screen.dart';
import 'package:todo_nti5/features/profile/views/settings/settings_screen.dart';
import 'package:todo_nti5/features/profile/views/update_profile/update_profile_screen.dart';
import 'package:todo_nti5/features/welcome/welcome_screen.dart';

import '../../features/add_and_edit_task/views/add_task/add_task_screen.dart';
import '../../features/add_and_edit_task/views/edit_task/edit_task_screen.dart';
import '../../features/home/data/models/task_model.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRouterKeys.splash,
  routes: [
    GoRoute(
      path: AppRouterKeys.splash,
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.welcome,
      name: 'welcome',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.login,
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.register,
      name: 'register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.home,
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.profile,
      name: 'profile',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.updateProfile,
      name: 'updateProfile',
      builder: (context, state) => UpdateProfileScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.changePassword,
      name: 'changePassword',
      builder: (context, state) => ChangePasswordScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.settings,
      name: 'settings',
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.addTasks,
      name: 'add_tasks',
      builder: (context, state) => AddTaskScreen(),
    ),
    GoRoute(
      path: AppRouterKeys.editTasks,
      name: 'edit_tasks',
      builder: (context, state) {
        final task = state.extra as TaskModel;
        return EditTaskScreen(task: task);
      },
    ),
  ],
);
