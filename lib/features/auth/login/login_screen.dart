import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/customized_widgets/customized_text_field.dart';

import '../../../core/customized_widgets/customized_auth_text.dart';
import '../../../core/resources/app_assets.dart';
import '../../home/home_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static final String routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                AppImages.authImage,
                width: 375.w,
                height: 298.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 23.h),
            CustomizedTextField(
              hintText: "Username",
              prefixIcon: AppIcons.profileIcon,
            ),
            SizedBox(height: 10.h),
            CustomizedTextField(
              hintText: "Password",
              prefixIcon: AppIcons.passwordIcon,
              isPassword: true,
            ),
            SizedBox(height: 23.h),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              child: CustomizedButton(title: "Login"),
            ),
            SizedBox(height: 23.h),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              child: CustomizedAuthText(
                prompt: "Don't have account?",
                title: "Register",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
