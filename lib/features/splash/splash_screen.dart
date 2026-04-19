import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/app_router/app_router.dart';
import 'package:todo_nti5/core/app_router/app_router_keys.dart';

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

      if (isFirstTime == null || isFirstTime == true) {
        context.go(AppRouterKeys.welcome);
      } else if (token == null || token.toString().isEmpty) {
        context.go(AppRouterKeys.login);
      } else {
        context.go(AppRouterKeys.home);
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
