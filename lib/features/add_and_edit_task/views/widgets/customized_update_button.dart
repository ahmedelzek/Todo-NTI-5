import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';

class CustomizedUpdateButton extends StatelessWidget {
  const CustomizedUpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.green, width: 2.w),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.green.withOpacity(0.7),
            offset: Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 10.w,
          ),
        ],
      ),
      child: Text(
        "Update",
        style: TextStyle(
          color: AppColors.green,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
