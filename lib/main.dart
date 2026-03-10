import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/app_theme.dart';
import 'package:todo_nti5/features/auth/login/login_screen.dart';
import 'package:todo_nti5/features/profile/profile_screen.dart';
import 'package:todo_nti5/features/welcome/welcome_screen.dart';

import 'features/auth/register/register_screen.dart';
import 'features/home/home_screen.dart';
import 'features/profile/chande_password/change_password_screen.dart';
import 'features/profile/update_profile/update_profile_screen.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      child: MaterialApp(
        title: 'Todo',
        theme: AppTheme.lightTheme,
        initialRoute: ProfileScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          UpdateProfileScreen.routeName: (context) => const UpdateProfileScreen(),
          ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
        },
      ),
    );
  }
}
