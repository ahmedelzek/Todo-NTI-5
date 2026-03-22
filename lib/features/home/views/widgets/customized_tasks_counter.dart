import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/text_styles.dart';

Widget customizedTasksCounter({required String title, required int count}){
  return Row(
    children: [
      Text(title, style: AppTextStyles.bodyMediumText()),
      SizedBox(width: 25.w),
      Container(
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
            color: AppColors.transparentGreen,
            shape: BoxShape.circle
        ),
        child: Text(
          "$count",
          style: TextStyle(color: AppColors.green),
        ),
      ),
    ],
  );
}