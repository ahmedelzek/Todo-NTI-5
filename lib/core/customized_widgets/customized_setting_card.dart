import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';

class CustomizedSettingCard extends StatelessWidget {
  final String? title;
  final String? icon;

  const CustomizedSettingCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.h,
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      margin: EdgeInsets.symmetric( vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon?? AppIcons.profileIcon,
            width: 24.w,
            height: 24.h,),
          SizedBox(width: 16.w,),
          Text(title??"", style: AppTextStyles.bodyLargeText(),),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: AppColors.grey,)
        ],
      ),
    );
  }
}
