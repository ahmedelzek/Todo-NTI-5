import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';

class CustomizedAuthText extends StatelessWidget {
  final String prompt ;
  final String title;
  const CustomizedAuthText({super.key, required this.prompt, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(prompt,style: TextStyle(
          color: AppColors.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w200,
        ),),
        SizedBox(width: 15.w,),
        Text(title, style: TextStyle(
          color: AppColors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ))
      ],
    );
  }
}
