import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';
import 'package:todo_nti5/core/resources/app_colors.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.authImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello!", style: TextStyle(
                color: AppColors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),),
              Text("Ahmad Adel", style: TextStyle(
                color: AppColors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ))
            ],
          )
        ],
      ),
    );
  }
}
