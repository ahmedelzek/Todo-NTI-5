import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

class EmptyTasksPrompt extends StatelessWidget {
  const EmptyTasksPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 96.w),
          child: Text(
            "There are no tasks yet, Press the button To add New Task",
            textAlign: TextAlign.center,
            style: TextStyleManger.bodyLargeText()
          ),
        ),
        SizedBox(height: 40.h),
        Image.asset(AppImages.emptyTaskImage, width: 305.w, height: 225.h)
      ],
    );
  }
}
