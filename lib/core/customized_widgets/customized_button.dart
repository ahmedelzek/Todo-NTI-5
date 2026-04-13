import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/app_colors.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

class CustomizedButton extends StatelessWidget {
  final String title;
  final Future<void>Function()? onTap;
  final bool clickAble;

  const CustomizedButton({
    super.key,
    required this.title,
    this.onTap,
    this.clickAble = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickAble ? onTap : null,
      child: Container(
        height: 50.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: clickAble ? AppColors.green : AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.green.withOpacity(0.7),
              spreadRadius: 2.w,
              blurRadius: 4.w,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child:
            clickAble
                ? Text(title, style: AppTextStyles.buttonTextStyle())
                : SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: CircularProgressIndicator(color: AppColors.green),
                ),
      ),
    );
  }
}
