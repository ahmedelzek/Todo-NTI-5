import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';

class DeleteButton extends StatelessWidget {
  final bool clickAble;
  final Function()? onTap;

  const DeleteButton({super.key, this.clickAble = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickAble ? onTap : null,
      child: Container(
        width: 80.w,
        height: 30.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: clickAble? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.deleteIcon),
            SizedBox(width: 5.w),
            Text(
              "Delete",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ): LinearProgressIndicator(color: AppColors.white,),
      ),
    );
  }
}
