import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/features/auth/views/login/login_screen.dart';
import 'package:todo_nti5/features/home/home_screen.dart';
import 'package:todo_nti5/features/welcome/welcome_screen.dart';

import '../../core/cache/cache_constants.dart';
import '../../core/cache/cache_helper.dart';
import '../../core/resources/app_assets.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      final isFirstTime = CacheHelper.getValue(CacheConstants.isFirstTime);
      final token = CacheHelper.getValue(CacheConstants.accessToken);

      if (isFirstTime == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => WelcomeScreen()),
          (r) => false,
        );
      } else if (token == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
          (r) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
          (r) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.splashImage, height: 344.h, width: 433.w),
      ),
    );
  }
}
