import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../../../../core/resources/app_colors.dart';

class CustomizedListTaskItem extends StatelessWidget {
  final String? title;
  final String? description;
  final String? date;
  final String? time;

  const CustomizedListTaskItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric( vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.transparentGreen,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.75),
            spreadRadius: 2.w,
            blurRadius: 4.w,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title", style: AppTextStyles.bodySmallLightText()),
                Text(
                  "$date\n$time",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmallLightText(),
                ),
              ],
            ),
            Expanded(
              child: Text(
                "$description",
                style: AppTextStyles.bodyMediumText(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
