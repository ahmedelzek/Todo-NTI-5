import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';

import '../../../../core/customized_widgets/customized_text_field.dart';
import '../../../../core/resources/app_assets.dart';



class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 20.w),
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
                hintText: "Old Password",
              ),
              SizedBox(height: 10.h),
              CustomizedTextField(
                hintText: "New Password",
              ),
              SizedBox(height: 10.h),
              CustomizedTextField(
                hintText: "Confirm Password",
              ),
              SizedBox(height: 23.h),
              CustomizedButton(title: "Save"),
            ],
          ),
        ),
      ),
    );
  }
}
