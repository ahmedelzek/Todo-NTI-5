import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/features/auth/login/login_screen.dart';

import '../../../core/customized_widgets/customized_auth_text.dart';
import '../../../core/customized_widgets/customized_button.dart';
import '../../../core/customized_widgets/customized_text_field.dart';
import '../../../core/resources/app_assets.dart';

class RegisterScreen extends StatelessWidget {
  static final String routeName = "/register";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              SizedBox(height: 10.h),
              CustomizedTextField(
                hintText: "Confirm Password",
                prefixIcon: AppIcons.passwordIcon,
                isPassword: true,
              ),
              SizedBox(height: 23.h),
              CustomizedButton(title: "Register",),
              SizedBox(height: 23.h),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomizedAuthText(
                  prompt: "Already have an account?",
                  title: "Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
