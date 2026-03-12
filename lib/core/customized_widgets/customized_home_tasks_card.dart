import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';

class CustomizedHomeTasksCard extends StatelessWidget {
  const CustomizedHomeTasksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your today’s tasks\n almost done!",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
             Row(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Text("76", style: TextStyle(
                   color: AppColors.white,
                   fontSize: 40.sp,
                   fontWeight: FontWeight.w500,
                 )),
                 Text("%", style: TextStyle(
                   color: AppColors.white,
                   fontSize: 24.sp,
                   fontWeight: FontWeight.w400,
                 ))
               ],
             ),
              Spacer(),
              Container(
                width: 120.w,
                height: 35.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  "View Tasks",
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}