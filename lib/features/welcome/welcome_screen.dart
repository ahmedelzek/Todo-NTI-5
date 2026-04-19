import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/app_router/app_router.dart';
import 'package:todo_nti5/core/app_router/app_router_keys.dart';
import 'package:todo_nti5/core/cache/cache_constants.dart';
import 'package:todo_nti5/core/cache/cache_helper.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../../core/customized_widgets/customized_button.dart';
import '../../core/resources/app_assets.dart';
import '../auth/views/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static final String routeName = "/welcome";

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 37.w),
              child: Image.asset(
                AppImages.welcomeImage,
                width: 302.w,
                height: 343.h,
              ),
            ),
            SizedBox(height: 60.h),
            Text(
              "Welcome To\n Do It !",
              textAlign: TextAlign.center,
              style: AppTextStyles.largeTitleText(),
            ),
            SizedBox(height: 40.h),
            Text(
              "Ready to conquer your tasks? Let's Do It together.",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLargeLightText(),
            ),
            SizedBox(height: 55.h),
            InkWell(
              onTap: () {
                CacheHelper.setValue(CacheConstants.isFirstTime, false);
                context.go(AppRouterKeys.login);
              },
              child: CustomizedButton(title: "Let's Start"),
            ),
          ],
        ),
      ),
    );
  }
}
