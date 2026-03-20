import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/app_router/app_router_keys.dart';
import 'package:todo_nti5/core/cache/cache_constants.dart';
import 'package:todo_nti5/core/cache/cache_helper.dart';
import 'package:todo_nti5/features/auth/views/login/login_screen.dart';
import 'package:todo_nti5/features/auth/views/register/register_screen.dart';
import 'package:todo_nti5/features/welcome/welcome_screen.dart';

import '../../features/home/views/home_screen.dart';
import '../../features/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRouterKeys.splash,
  routes: [
    GoRoute(
      path:AppRouterKeys.splash,
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path:AppRouterKeys.welcome,
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
  ],
);
