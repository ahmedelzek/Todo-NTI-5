import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/app_colors.dart';

class CustomizedButton extends StatelessWidget {
  final String title;
  const CustomizedButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 23.w),
      height: 50.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.green.withOpacity(0.25),
            spreadRadius: 2.w,
            blurRadius: 4.w,
            offset: Offset(0, 3.h),
          )
        ]
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.transparentGreen,
          fontSize: 19.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
