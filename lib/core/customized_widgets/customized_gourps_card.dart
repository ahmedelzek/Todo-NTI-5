import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';

class CustomizedGroupsCard extends StatelessWidget {
  final String title;
  final String icon;
  final int count;
  final Color color;
  final Color backgroundColor;

  const CustomizedGroupsCard({
    super.key,
    required this.title,
    this.icon = AppIcons.homeIcon,
    required this.count,
    this.color= AppColors.pink,
    this.backgroundColor = AppColors.transparentPink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 63.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            height: 35.h,
            width: 35.w,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: SvgPicture.asset(
              icon,
              width: 15.w,
              height: 15.h,
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text("Work Tasks", style: AppTextStyles.bodyMediumText()),
          Spacer(),
          Container(
            width: 22.w,
            height: 22.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Text(
              "$count",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
