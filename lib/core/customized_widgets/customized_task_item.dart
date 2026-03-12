import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_nti5/core/demo_data/demo_tasks_data.dart';
import 'package:todo_nti5/core/demo_data/extention_fun.dart';

class CustomizedTaskItem extends StatelessWidget {
final TaskModel taskModel;

  const CustomizedTaskItem({
    super.key,
    required this.taskModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 234.w,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: taskModel.taskType.backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskModel.title,
                style: TextStyle(
                  color: taskModel.taskType.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: 22.w,
                height: 22.h,
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: taskModel.taskType.iconBackground,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: SvgPicture.asset(
                  taskModel.taskType.icon,
                  width: 12.w,
                  height: 12.h,
                ),
              ),
            ],
          ),
          Text(
            taskModel.description,
            style: TextStyle(
              color: taskModel.taskType.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
